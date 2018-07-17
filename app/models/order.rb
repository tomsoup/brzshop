# == Schema Information
#
# Table name: orders
#
#  id          :bigint(8)        not null, primary key
#  total       :integer          default(0)
#  tax         :integer          default(0)
#  status      :integer          default("created")
#  customer_id :bigint(8)
#  cart_id     :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :cart
  has_one :charge

  enum status: { created: 0, proccessing: 1, paid: 2, fullfilment: 3 , shipped: 4, delivered: 5}

  after_initialize :set_defaul_total
  after_save :update_cart_status

  private
  
  def set_defaul_total
    tax_rate = 0.0875
    self.total = self.cart.subtotal
    self.tax = self.cart.subtotal * tax_rate
  end

  def update_cart_status
    if status == "paid" ||  (status != "created" && status != "proccessing")
    cart.update(status: 2)
    end
  end

end
