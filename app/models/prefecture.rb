class Prefecture < ApplicationRecord
  self.primary_key = :prefecture_id
  has_many :crossing_prefectures, dependent: :destroy, primary_key: :prefecture_id , foreign_key: :prefecture_id
end
