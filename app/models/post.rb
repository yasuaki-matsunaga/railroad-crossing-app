class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, length: { maximum: 65_535 }

  belongs_to :user
  belongs_to :crossing, primary_key: :crossing_id, foreign_key: :crossing_id

  has_many :comments, dependent: :destroy

  mount_uploader :crossing_image, CrossingImageUploader
end
