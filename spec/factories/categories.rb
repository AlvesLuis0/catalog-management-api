FactoryBot.define do
  factory :category do
    association :owner
    title { "My category" }
    description { "My text" }
  end
end
