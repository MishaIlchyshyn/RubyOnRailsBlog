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
        attributes = %w{image title created_at updated_at}
        
        CSV.generate(headers: true) do |csv|
            csv << attributes
            all.find_each do |post|
                csv << attributes.map{ |attr| post.send(attr) }
            end
        end
    end

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Post.create! row.to_hash
        end
    end
end