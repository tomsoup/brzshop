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

# Seed 10 Complete Orders

# 4 Should be successful Orders:

@customer_one = Customer.find(1)
@customer_two = Customer.find(2)
@customer_three = Customer.find(3)

@products = [*1..Product.all.size]
#  - 1 Should be linked to Customer 1

1.times do |buy|
  @customer_one.carts.create!(product_ids: @products.sample(5))
  cart = Cart.last
  cart.create_order!(
    customer_id: @customer_one.id
  )
  order = Order.last
  order.create_charge!(
    paid: true
  )
end

puts "Created 1 successful order for Customer 1"

#   - 2 Should be linked to Customer 2

2.times do |buy|
  @customer_two.carts.create!(product_ids:  @products.sample(5))
  cart = Cart.last
  cart.create_order!(
    customer_id: @customer_two.id
  )
  order = Order.last
  order.create_charge!(
    paid: true
  )
end

puts "Created 2 successful order for Customer 2"

#   - 1 Should be linked to Customer 3

1.times do |buy|
  @customer_three.carts.create!(product_ids:  @products.sample(5))
  cart = Cart.last
  cart.create_order!(
    customer_id: @customer_three.id
  )
  order = Order.last
  order.create_charge!(
    paid: true
  )
end

puts "Created 1 successful order for Customer 3"

# 3 Should be orders with abandoned cart
# - 2 Should be linked to Customer 3

2.times do |buy|
  @customer_three.carts.create!(product_ids: @products.sample(5))
  cart = Cart.last
  cart.create_order!(
    customer_id: @customer_three.id
  )
  cart.update!(status: 1)
end
  
  # - 1 Should be linked to Customer 1

puts "Created 2 abandoned cart + order for Customer 3"

1.times do |buy|
  @customer_one.carts.create!(product_ids: @products.sample(5))
  cart = Cart.last  
  cart.create_order!(
    customer_id: @customer_one.id
  )
  cart.update!(status: 1)
end

puts "Created 1 abandoned cart + order for Customer 1"

# 3 should be disputed:
  # - 3 should be linked to Customer 3

3.times do |buy|
  @customer_three.carts.create!(product_ids: @products.sample(5))
  cart = Cart.last
  cart.create_order!(
    customer_id: @customer_three.id
  )
  order = Order.last
  order.create_charge!(
    disputed: true
  )
end

puts "Created 3 disputed order for Customer 3"