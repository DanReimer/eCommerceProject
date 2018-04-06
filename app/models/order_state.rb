# frozen_string_literal: true

class OrderState < ApplicationRecord
  has_many :orders, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
end
