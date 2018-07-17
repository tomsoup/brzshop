# == Schema Information
#
# Table name: customers
#
#  id         :bigint(8)        not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Customer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
