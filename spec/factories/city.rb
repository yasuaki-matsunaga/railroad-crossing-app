FactoryBot.define do
  factory :city do
    city_name { "多摩市" }
    prefecture_id { 13 }
    association :prefecture
  end
end