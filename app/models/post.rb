class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, length: { maximum: 65_535 }

  belongs_to :user
  belongs_to :crossing, primary_key: :crossing_id, foreign_key: :crossing_id

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  mount_uploader :crossing_image, CrossingImageUploader
end
