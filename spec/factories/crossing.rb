FactoryBot.define do
  factory :crossing do
    sequence(:crossing_id) { |n| n }
    crossing_name { "テスト踏切" }
    latitude { 35.6895 }
    longitude { 139.6917 }
    city_id { 13224 }
    association :city
  end
end