class Prefecture < ApplicationRecord
  self.primary_key = :prefecture_id

  has_many :cities, dependent: :destroy, primary_key: :prefecture_id, foreign_key: :prefecture_id, inverse_of: :prefecture
end
