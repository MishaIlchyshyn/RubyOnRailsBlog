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
end