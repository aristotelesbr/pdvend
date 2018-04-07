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

# Product model
class Product < ApplicationRecord
  validates :name, :description, :product_value, :height, :weight,
            :width, :product_length, presence: true
end
