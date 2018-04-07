# frozen_string_literal: true

# Product model
class Product < ApplicationRecord
  validates :name, :description, :product_value, :height, :weight,
            :width, :product_length, presence: true
end
