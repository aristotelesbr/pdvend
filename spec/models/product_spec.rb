# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string(120)      not null
#  description    :string(65535)
#  product_value  :decimal(12, 2)
#  height         :float            not null
#  weight         :float            not null
#  width          :float            not null
#  product_length :float            not null
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
