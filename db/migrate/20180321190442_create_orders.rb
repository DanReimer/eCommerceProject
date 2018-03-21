class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.decimal :subtotal
      t.decimal :gst_amount
      t.decimal :pst_amount
      t.decimal :hst_amount

      t.timestamps
    end
  end
end
