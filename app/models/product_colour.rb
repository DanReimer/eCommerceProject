# frozen_string_literal: true

class ProductColour < ApplicationRecord
  belongs_to :product
  belongs_to :colour
end
