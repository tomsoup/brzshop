require 'rails_helper'

RSpec.describe 'Product Updating ' do
  # Initialize the test data

  let!(:customer_one) { create(:customer)}
  let!(:products) {create_list(:product, 5)}
  let!(:cart) { customer_one.carts.create!(product_ids: [products.first.id])}

  describe 'If the price of one product change, the price in the cart should stay as the original' do
    it 'should update the product price but not the cart price' do
      Product.first.update(price: Faker::Number.between(99, 10000))
      expect(cart.subtotal).not_to eq(Product.first.price)
      expect(cart.subtotal).to eq(products.first.price)
    end
  end
end