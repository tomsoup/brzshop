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

require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
