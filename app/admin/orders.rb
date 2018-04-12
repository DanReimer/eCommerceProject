ActiveAdmin.register Order do
  permit_params :user_id, :gst_rate, :pst_rate, :hst_rate, :subtotal
end
