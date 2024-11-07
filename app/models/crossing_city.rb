class CrossingCity < ApplicationRecord
  belongs_to :crossing, foreign_key: :crossing_id, primary_key: :crossing_id
  belongs_to :city, foreign_key: :city_id, primary_key: :city_id

  validates :crossing_id, uniqueness: { scope: :city_id }
end
