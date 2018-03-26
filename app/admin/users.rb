ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :username, :street, :city, :province_id, :postal_code, :admin

  actions :all, except: %i[create new]

  form do |f|
    f.semantic_errors
    f.inputs :username, :street, :city, :province, :postal_code, :admin
    f.actions
  end

end
