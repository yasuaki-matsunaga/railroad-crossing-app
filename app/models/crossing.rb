class Crossing < ApplicationRecord
  self.primary_key = :crossing_id

  belongs_to :city, primary_key: :city_id, foreign_key: :city_id, inverse_of: :crossings

  has_many :crossing_railways, dependent: :destroy, primary_key: :crossing_id, foreign_key: :crossing_id, inverse_of: :crossing
  has_many :linked_railways, through: :crossing_railways, source: :railway

  has_many :posts, dependent: :destroy, foreign_key: :crossing_id, primary_key: :crossing_id, inverse_of: :crossing

  acts_as_mappable default_units: :kms, lat_column_name: :latitude, lng_column_name: :longitude
end
