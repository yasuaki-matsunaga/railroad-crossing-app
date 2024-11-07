class CrossingPrefecture < ApplicationRecord
  belongs_to :crossing, foreign_key: :crossing_id, primary_key: :crossing_id
  belongs_to :prefecture, foreign_key: :prefecture_id, primary_key: :prefecture_id

  validates :crossing_id, uniqueness: { scope: :prefecture_id }
end