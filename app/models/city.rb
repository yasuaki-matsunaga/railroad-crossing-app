class City < ApplicationRecord
  self.primary_key = :city_id

  belongs_to :prefecture, primary_key: :prefecture_id, foreign_key: :prefecture_id, inverse_of: :cities
  has_many :crossings, dependent: :destroy, primary_key: :city_id, foreign_key: :city_id, inverse_of: :city
end
