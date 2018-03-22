class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :colour

  validates :order, :product, :colour, :quantity, :price_per_item, presence: true
  validates :quantity, numericality: { greater_than: 0, only_integer: true }
  validates :price_per_item, numericality: { greater_than_or_equal_to: 0 }
end
