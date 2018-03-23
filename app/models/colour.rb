class Colour < ApplicationRecord
  has_many :order_items
  has_many :products, through: :product_colours
  has_many :product_colours

  VALID_COLOUR_HEXCODE = /\A#[0-9A-Fa-f]{6}\z/
  validates :hexcode, presence: true, format: { with: VALID_COLOUR_HEXCODE }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
