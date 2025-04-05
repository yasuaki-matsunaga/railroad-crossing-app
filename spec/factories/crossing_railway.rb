FactoryBot.define do
  factory :crossing_railway do
    association :crossing
    association :railway
  end
end
