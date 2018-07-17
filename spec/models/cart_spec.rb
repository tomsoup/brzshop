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

require 'rails_helper'

RSpec.describe Cart, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
