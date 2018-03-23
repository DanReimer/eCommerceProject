class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :colours, through: :product_colours
  has_many :product_colours

  validates :name, :price, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :name, length: { maximum: 128 }
end
