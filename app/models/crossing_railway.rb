class CrossingRailway < ApplicationRecord
  self.primary_key = :id

  belongs_to :crossing, foreign_key: :crossing_id, primary_key: :crossing_id, inverse_of: :crossing_railways
  belongs_to :railway, foreign_key: :railway_id, primary_key: :railway_id, inverse_of: :crossing_railways

  validates :crossing_id, uniqueness: { scope: :railway_id }
end
