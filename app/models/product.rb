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

# Product model
class Product < ApplicationRecord
  validates :name, :description, :product_value, :height, :weight,
            :width, :product_length, presence: true

  validate :height_greater_width, on: [:create]
  validate :valid_weight, on: [:create]

  private

  def height_greater_width
    return if height.present? && product_length.present? && height < product_length
    errors.add(:height, 'A altura nao pode ser maior que o comprimento.')
  end
end
