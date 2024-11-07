class City < ApplicationRecord
  self.primary_key = :city_id
  has_many :crossing_cities, dependent: :destroy, primary_key: :city_id , foreign_key: :city_id
end
