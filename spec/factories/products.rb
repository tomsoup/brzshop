
FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price { Faker::Number.between(99, 10000) }
    qty { Faker::Number.between(100, 1000) }
  end
end
