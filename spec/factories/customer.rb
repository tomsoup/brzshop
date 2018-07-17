
FactoryBot.define do
  factory :customer do
    email { Faker::Internet.unique.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
