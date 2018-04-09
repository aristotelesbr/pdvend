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

  describe '#height_greater_width' do
    context 'when valid data' do
      let(:product) { build(:product) }
      it 'save product' do
        expect(product.save).to be_truthy
      end
    end

    context 'when invalid data' do
      let(:product) { build(:product, height: 10, product_length: 9) }
      it 'dont save product' do
        expect(product.save).to be_falsey
      end
      it 'returns errors key' do
        product.save
        expect(product.errors.messages).to include(:height)
      end
    end
  end
end
