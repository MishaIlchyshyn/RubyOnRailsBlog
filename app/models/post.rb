class Post < ActiveRecord::Base
    acts_as_punchable
    has_rich_text :content
    has_many :comments, dependent: :destroy
    validates :title, presence: true, 
        length: {minimum: 3, maximum: 50}
    validates :description, presence: true, 
        length: {minimum: 10, maximum: 2000}
    mount_uploader :image, ImageUploader
end