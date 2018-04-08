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
#  weight         :decimal(12, 2)
#  width          :float            not null
#  product_length :float            not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#


# ProductSerializer
class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :product_value,
             :height, :weight, :width, :product_length
end
