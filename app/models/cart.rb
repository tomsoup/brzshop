# == Schema Information
#
# Table name: carts
#
#  id           :bigint(8)        not null, primary key
#  subtotal     :integer          default(0)
#  status       :integer          default(0)
#  products_qty :integer          default(0)
#  customer_id  :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Cart < ApplicationRecord
  belongs_to :customer
  has_many :line_items
  has_many :products, through: :line_items
  has_one :order

  enum status: { created: 0, abandoned: 1, paid: 2 }

  before_save :get_subtotal
  before_save :get_products_qty

  private

  def get_subtotal
    self.subtotal = line_items.inject(0) do |sum, item|
      sum + (item.qty * item.product.price)
    end
  end

  def get_products_qty
    self.products_qty = line_items.inject(0) do |sum, item|
      sum + item.qty
    end
  end

end
