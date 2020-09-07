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
        CSV.generate(options) do |csv|
            csv << column_names
            all.each do |post|
                csv << post.attributes.values_at(*column_names)
            end
        end
    end
end