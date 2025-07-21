FactoryBot.define do
  factory :product do
    title { "My product" }
    description { "My text" }
    price { 9.99 }
    category_id { nil }
  end
end
