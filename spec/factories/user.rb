FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test_name#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    after(:build) do |user|
      user.password = "password1234"
      user.password_confirmation = "password1234"
    end
  end
end
