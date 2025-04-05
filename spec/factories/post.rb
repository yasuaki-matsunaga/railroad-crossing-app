FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "title#{n}" }
    body { "body" }
    crossing_image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/sample.jpg'), 'image/jpeg') }
    association :user
    association :crossing
  end
end
