class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_state
  has_many :order_items

  validates :user, presence: true
  validates :subtotal, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :gst_amount, :pst_amount, :hst_amount,
            numericality: { greater_than_or_equal_to: 0 },
            allow_nil: true

  def self.in_progress_order(user)
    in_progress_orders = where(user: user).where(order_state_id: 1)
    if in_progress_orders.empty?
      create!(user: user, order_state_id: 1, subtotal: 0)
    else
      in_progress_orders.take
    end
  end
end
