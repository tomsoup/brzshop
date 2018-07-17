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

  enum status: { created: 0, proccessing: 1, paid: 2, fullfilment: 3 , shipped: 4, delivered: 5}
end
