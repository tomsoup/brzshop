require 'rails_helper'

RSpec.describe 'Line Item Editing' do
  # Initialize the test data

  let!(:customer_one) { create(:customer)}
  let!(:products) {create_list(:product, 5)}
  let!(:unpaid_cart) { customer_one.carts.create!(product_ids: [products.first.id])}
  let!(:paid_cart) { customer_one.carts.create!(product_ids: [products.first.id])}

  describe 'If the cart still unpaid, and the quantity of some LineItem change, the Price of Cart must be updated.' do
    it 'shouldn\'t update a paid cart' do
      paid_cart.update(status: 2)
      subtotal = paid_cart.subtotal
      paid_cart.line_items.first.update(qty: 10)
      expect(paid_cart.products_qty).to eq(1)
      expect(paid_cart.subtotal).to eq(subtotal)
    end

    it 'should update the product price ' do
      subtotal = unpaid_cart.subtotal
      unpaid_cart.line_items.first.update(qty: 10)
      expect(unpaid_cart.products_qty).to eq(10)
      expect(unpaid_cart.subtotal).not_to eq(subtotal)
      
    end
  end
end