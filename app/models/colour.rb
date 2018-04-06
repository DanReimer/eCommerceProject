# frozen_string_literal: true

class Colour < ApplicationRecord
  has_many :order_items, dependent: :restrict_with_error
  has_many :product_colours, dependent: :destroy
  has_many :products, through: :product_colours

  VALID_COLOUR_HEXCODE = /\A#[0-9A-F]{6}\z/i
  validates :hexcode, presence: true, format: { with: VALID_COLOUR_HEXCODE }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
