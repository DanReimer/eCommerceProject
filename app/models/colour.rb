class Colour < ApplicationRecord
  has_many :order_items
  has_many :products, through: :product_colours
end
