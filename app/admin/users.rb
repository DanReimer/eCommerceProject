ActiveAdmin.register User do
  permit_params :username, :street, :city, :province_id, :postal_code, :admin

  actions :all, except: %i[create new]

  form do |f|
    f.semantic_errors
    f.inputs :username, :street, :city, :province, :postal_code, :admin
    f.actions
  end
end
