class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true

  def self.to_csv(options = {})
    attributes = %w{commenter body created_at updated_at}

    CSV.generate(headers: true) do |csv|
        csv << attributes

        all.find_each do |comment|
            csv << attributes.map{ |attr| comment.send(attr) }
        end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Comment.create! row.to_hash
    end
  end
end
