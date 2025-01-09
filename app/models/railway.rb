class Railway < ApplicationRecord
  self.primary_key = :railway_id
  has_many :crossing_railways, dependent: :destroy, primary_key: :railway_id, foreign_key: :railway_id, inverse_of: :railway
end
