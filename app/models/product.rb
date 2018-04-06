# frozen_string_literal: true

# A P4P product for sale
class Product < ApplicationRecord
  attr_writer :remove_image

  def remove_image
    @remove_image || false
  end

  before_validation { image.purge if remove_image == '1' }

  belongs_to :category
  has_many :order_items
  has_many :product_colours, dependent: :destroy
  has_many :colours, through: :product_colours

  validates :name, :price, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :name, length: { maximum: 128 }
  validates :colours, presence: true

  has_one_attached :image

  def self.search(search, category_filter)
    if search
      result = where('name LIKE ?', "%#{search}%")

      unless category_filter.blank?
        result = result.where(category_id: category_filter)
      end

      result
    else
      none
    end
  end
end
