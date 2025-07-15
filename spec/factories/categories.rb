FactoryBot.define do
  factory :category do
    association :owner
    name { "My category" }
  end
end
