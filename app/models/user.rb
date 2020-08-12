class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :favorited, source_type: "Post"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
