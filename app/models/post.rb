class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, length: { maximum: 65_535 }
  validates :crossing_image, presence: true

  belongs_to :user
  belongs_to :crossing, primary_key: :crossing_id, foreign_key: :crossing_id, inverse_of: :posts

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  mount_uploader :crossing_image, CrossingImageUploader

  acts_as_taggable_on :tags
end
