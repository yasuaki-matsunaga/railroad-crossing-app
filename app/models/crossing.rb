class Crossing < ApplicationRecord
  self.primary_key = :crossing_id

  belongs_to :city, primary_key: :city_id, foreign_key: :city_id

  has_many :crossing_railways, dependent: :destroy, primary_key: :crossing_id , foreign_key: :crossing_id
  has_many :linked_railways, through: :crossing_railways, source: :railway
  
  has_many :posts, dependent: :destroy, foreign_key: :crossing_id, primary_key: :crossing_id
end
