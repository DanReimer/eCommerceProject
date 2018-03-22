class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  validates :user, presence: true
  validates :subtotal, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :gst_amount, :pst_amount, :hst_amount,
            numericality: { greater_than_or_equal_to: 0 },
            allow_nil: true
end
