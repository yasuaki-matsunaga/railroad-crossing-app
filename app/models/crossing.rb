class Crossing < ApplicationRecord
  self.primary_key = :crossing_id
  has_many :crossing_prefectures, dependent: :destroy, primary_key: :crossing_id , foreign_key: :crossing_id
  has_many :crossing_cities, dependent: :destroy, primary_key: :crossing_id , foreign_key: :crossing_id
  has_many :crossing_railways, dependent: :destroy, primary_key: :crossing_id , foreign_key: :crossing_id
  has_many :linked_prefectures, through: :crossing_prefectures, source: :prefecture
  has_many :linked_cities, through: :crossing_cities, source: :city
  has_many :linked_railways, through: :crossing_railways, source: :railway
  
  has_many :posts, dependent: :destroy, foreign_key: :crossing_id, primary_key: :crossing_id
end
