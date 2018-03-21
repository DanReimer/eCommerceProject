class ProductColour < ApplicationRecord
  belongs_to :product
  belongs_to :colour
end
