# frozen_string_literal: true

# Categories used for separating products into subsets.
class Category < ApplicationRecord
  has_many :products

  validates :name, presence: true, uniqueness: true
end
