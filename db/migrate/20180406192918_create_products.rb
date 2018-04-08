# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, limit: 120, null: false
      t.string :description, limit: 65_535
      t.decimal :product_value, precision: 12, scale: 2
      t.float :height, null: false
      t.decimal :weight, precision: 12, scale: 2
      t.float :width, null: false
      t.float :product_length, null: false

      t.timestamps
    end
  end
end
