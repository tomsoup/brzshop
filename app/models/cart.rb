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
  
end
