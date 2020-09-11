class Post < ActiveRecord::Base
    include Discard::Model
    acts_as_punchable
    has_rich_text :body
    has_many :comments, dependent: :destroy
    validates :title, presence: true, 
        length: {minimum: 3, maximum: 50}
    validates :body, presence: true, 
        length: {minimum: 10, maximum: 2000}
    mount_uploader :image, ImageUploader
    acts_as_taggable_on :tags

    def self.to_csv(options = {})
        attributes = %w{id image title created_at updated_at}
        
        CSV.generate(headers: true) do |csv|
            csv << attributes
            all.find_each do |post|
                csv << attributes.map{ |attr| post.send(attr) }
            end
        end
    end

    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |i|
            row = Hash[[header, spreadsheet.row(i)].transpose]
            post = find_by_id(row["id"]) || new
            post.attributes = row.to_hash.slice(*row.to_hash.keys)
            post.save!
        end
    end

    def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
        when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
        when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
        when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
        else raise "Unknown file type: #{file.original_filename}"
        end
    end
end