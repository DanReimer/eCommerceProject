# frozen_string_literal: true

# Province names and tax rates.
class Province < ApplicationRecord
  has_many :users, dependent: :restrict_with_error

  validates :gst_rate, :pst_rate, :hst_rate,
            numericality: { greater_than_or_equal_to: 0 },
            allow_nil: true
  validates :name, :abbreviation, presence: true, uniqueness: true
  validates :abbreviation, format: { with: /\A[A-Z][A-Z]\z/ }
end
