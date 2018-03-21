class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.references :colour, foreign_key: true
      t.integer :quantity
      t.decimal :price_per_item

      t.timestamps
    end
  end
end
