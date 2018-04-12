# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :colour

  before_save :finalize

  validates :order, :product, :colour, :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0, only_integer: true }
  validates :price_per_item, numericality: { greater_than_or_equal_to: 0 },
                             allow_nil: true

  def price_per_item
    persisted? ? self[:price_per_item] : product.price
  end

  def total_price
    price_per_item * quantity
  end

  private

  def finalize
    self[:price_per_item] = price_per_item
  end
end
