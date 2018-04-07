# frozen_string_literal: true

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
