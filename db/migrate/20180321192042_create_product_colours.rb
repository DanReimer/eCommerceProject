class CreateProductColours < ActiveRecord::Migration[5.1]
  def change
    create_table :product_colours do |t|
      t.references :product, foreign_key: true
      t.references :colour, foreign_key: true

      t.timestamps
    end
  end
end
