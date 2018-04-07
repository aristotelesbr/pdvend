# frozen_string_literal: true

# ProductSerializer
class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :product_value,
             :height, :weight, :width, :product_length
end
