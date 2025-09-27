class CrossingFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :crossing, primary_key: :crossing_id

  validates :user_id, uniqueness: { scope: :crossing_id }
end
