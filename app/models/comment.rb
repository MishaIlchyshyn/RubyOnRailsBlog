class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
        csv << column_names
        all.each do |comment|
            csv << comment.attributes.values_at(*column_names)
        end
    end
  end
end
