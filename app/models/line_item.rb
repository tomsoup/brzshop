# == Schema Information
#
# Table name: line_items
#
#  id         :bigint(8)        not null, primary key
#  cart_id    :bigint(8)
#  product_id :bigint(8)
#  qty        :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  before_save do
    if cart.status != "created"
      errors.add(:status, 'Cannot modified an abandonded or paid Cart')
      throw(:abort)
    end
  end

  after_save do
    cart.save!
  end
end
