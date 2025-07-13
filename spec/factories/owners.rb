FactoryBot.define do
  factory :owner do
    sequence(:email) { |n| "owner#{n}@example.com" }
    password { 'password123' }
    password_confirmation { 'password123' }
    confirmed_at { Time.current } # para pular confirmação Devise
  end
end
