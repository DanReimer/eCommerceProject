class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_state
  has_many :order_items

  before_create :set_initial_state
  before_save :update_subtotal, :update_tax_amounts

  validates :user, presence: true
  validates :subtotal, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :gst_amount, :pst_amount, :hst_amount,
            numericality: { greater_than_or_equal_to: 0 },
            allow_nil: true

  def self.in_progress_order(user)
    in_progress_orders = where(user: user).where(order_state_id: 1)
    if in_progress_orders.empty?
      create!(user: user)
    else
      in_progress_orders.take
    end
  end

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.price_per_item.to_f) : 0 }.sum
  end

  def total
    subtotal +
        (gst_amount ? gst_amount : 0) +
        (pst_amount ? pst_amount : 0) +
        (hst_amount ? hst_amount : 0)
  end

  private

  def set_initial_state
    self.order_state_id = 1
    self[:subtotal] = 0
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def update_tax_amounts
    province = user.province
    self.gst_amount = calc_tax_amount province.gst_rate
    self.pst_amount = calc_tax_amount province.pst_rate
    self.hst_amount = calc_tax_amount province.hst_rate
  end

  def calc_tax_amount(rate)
    if rate.nil?
      nil
    else
      subtotal * rate
    end
  end
end
