class Crossing < ApplicationRecord
  self.primary_key = :crossing_id
  has_many :crossing_prefectures, dependent: :destroy, primary_key: :crossing_id , foreign_key: :crossing_id
  has_many :crossing_cities, dependent: :destroy, primary_key: :crossing_id , foreign_key: :crossing_id
  has_many :crossing_railways, dependent: :destroy, primary_key: :crossing_id , foreign_key: :crossing_id
  has_many :crossing_p, through: :crossing_prefectures, source: :prefectures
  has_many :crossing_c, through: :crossing_cities, source: :cities
  has_many :crossing_r, through: :crossing_railways, source: :railways
end
