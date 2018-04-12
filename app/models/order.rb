# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_state
  has_many :order_items, dependent: :destroy

  before_validation :default_user
  before_save :update_subtotal

  validates :subtotal, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :gst_rate, :pst_rate, :hst_rate,
            numericality: { greater_than_or_equal_to: 0 },
            allow_nil: true

  def place_order
    raise Exception, 'order already placed' if placed?

    update_tax_rates
    self.order_state_id = 2
  end

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.price_per_item.to_f) : 0 }.sum
  end

  def gst_amount
    calc_tax_amount gst_rate
  end

  def gst_rate
    if placed?
      self[:gst_rate]
    else
      user&.province&.gst_rate
    end
  end

  def pst_amount
    calc_tax_amount pst_rate
  end

  def pst_rate
    if placed?
      self[:pst_rate]
    else
      user&.province&.pst_rate
    end
  end

  def hst_amount
    calc_tax_amount hst_rate
  end

  def hst_rate
    if placed?
      self[:hst_rate]
    else
      user&.province&.hst_rate
    end
  end

  def total
    subtotal +
      (gst_amount || 0) +
      (pst_amount || 0) +
      (hst_amount || 0)
  end

  def placed?
    order_state.name == 'Placed'
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def update_tax_rates
    self[:gst_rate] = gst_rate
    self[:pst_rate] = pst_rate
    self[:hst_rate] = hst_rate
  end

  def calc_tax_amount(rate)
    rate.nil? ? nil : subtotal * rate
  end

  def default_user
    self.user ||= User.new
  end
end
