class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :product_value
      t.integer :height
      t.decimal :weight
      t.integer :width
      t.integer :product_length

      t.timestamps
    end
  end
end
