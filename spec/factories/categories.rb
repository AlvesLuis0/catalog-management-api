FactoryBot.define do
  factory :category do
    association :owner
    title { "My category" }
  end
end
