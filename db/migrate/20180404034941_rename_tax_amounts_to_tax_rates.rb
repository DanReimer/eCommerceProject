class RenameTaxAmountsToTaxRates < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :gst_amount, :gst_rate
    rename_column :orders, :pst_amount, :pst_rate
    rename_column :orders, :hst_amount, :hst_rate
  end
end
