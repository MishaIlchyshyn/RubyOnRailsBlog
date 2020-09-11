class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true

  def self.to_csv(options = {})
    attributes = %w{id commenter body created_at updated_at}

    CSV.generate(headers: true) do |csv|
        csv << attributes

        all.find_each do |comment|
            csv << attributes.map{ |attr| comment.send(attr) }
        end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        comment = find_by_id(row["id"]) || new
        comment.attributes = row.to_hash.slice(*row.to_hash.keys)
        comment.save!
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
