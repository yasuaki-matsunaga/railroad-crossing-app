class CrossingRailway < ApplicationRecord
  belongs_to :crossing, foreign_key: :crossing_id, primary_key: :crossing_id
  belongs_to :railway, foreign_key: :railway_id, primary_key: :railway_id

  validates :crossing_id, uniqueness: { scope: :railway_id }
end
