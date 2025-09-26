class CrossingFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :crossing

  validates :user_id, uniqueness: { scope: :crossing_id }
end
