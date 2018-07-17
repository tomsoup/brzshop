# "Seed 3 Customers."

3.times do |customer|
  Customer.create!(
    first_name: "Customer",
    last_name: customer + 1,
    email: "#{customer + 1}#{Faker::Internet.unique.email }"
  )
  puts "Customer #{customer + 1} created"
end


# "Seed as many products as you want"

20.times do |prod|
  Product.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    price: Faker::Number.between(99, 10000),
    qty: Faker::Number.between(100, 1000)
  )
end

puts "20 Products created"