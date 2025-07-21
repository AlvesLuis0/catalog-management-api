FactoryBot.define do
  factory :owner do
    sequence(:email) { |n| "owner#{n}@example.com" }
    sequence(:name) { |n| "Owner #{n}" }
    password { 'password123' }
    password_confirmation { 'password123' }
    confirmed_at { Time.current }
  end
end
