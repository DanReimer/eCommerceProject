# frozen_string_literal: true

class OrderState < ApplicationRecord
  has_many :orders

  validates :name, presence: true, uniqueness: true
end
