ActiveAdmin.register Product do
  require 'mini_magick'

  permit_params :category_id, :name, :price, :description, :image, :remove_image, colour_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :description do |product|
      product.description.truncate(50, separator: /\w+/)
    end
    column :category
    column 'Colours' do |product|
      product.colours.map(&:name).join(', ')
    end
    column :image do |product|
      image = product.image
      image.attached? ? link_to(image.filename, url_for(image)) : ''
    end
    column :created_at
    column :updated_at
    actions
  end

  show title: :name do
    attributes_table do
      row :id
      row :category
      row :price
      row :description
      row :colours do
        product.colours.map(&:name).join(', ')
      end
      row :image do
        image_tag product.image.variant(resize:'100x100'), alt: product.name if product.image.attached?
      end
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :category
      f.input :price
      f.input :description
      f.input :image, as: :file
      f.input :remove_image, as: :boolean, required: false, label: 'Remove Image'
      f.input :colours, as: :check_boxes, collection: Colour.all, label: 'Avaliable Colours'
    end
    f.actions
  end
end
