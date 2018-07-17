class Charge < ApplicationRecord
  belongs_to :order

  after_initialize :set_defaul_charge
  after_save :update_order

  private
  
  def set_defaul_charge
    self.amount = self.order.total + self.order.tax
  end

  def update_order
    if !refunded && !disputed && paid
      order.update(status: 2)
    end
  end
end
