# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :string
#  product_value  :decimal(, )
#  height         :integer
#  weight         :decimal(, )
#  width          :integer
#  product_length :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:product_value) }
  it { is_expected.to validate_presence_of(:height) }
  it { is_expected.to validate_presence_of(:weight) }
  it { is_expected.to validate_presence_of(:width) }
  it { is_expected.to validate_presence_of(:product_length) }
end
