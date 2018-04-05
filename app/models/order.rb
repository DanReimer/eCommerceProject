class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_state
  has_many :order_items

  before_validation :default_user
  # TODO: deal with initial state.
  # There are probably some bugs around the creation and retrieval of orders ight now.
  # before_create :set_initial_state
  before_save :update_subtotal, :update_tax_rates

  validates :subtotal, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :gst_rate, :pst_rate, :hst_rate,
            numericality: { greater_than_or_equal_to: 0 },
            allow_nil: true

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.price_per_item.to_f) : 0 }.sum
  end

  def gst_amount
    calc_tax_amount gst_rate
  end

  def gst_rate
    if persisted?
      self[:gst_rate]
    else
      user&.province&.gst_rate
    end
  end

  def pst_amount
    calc_tax_amount pst_rate
  end

  def pst_rate
    if persisted?
      self[:pst_rate]
    else
      user&.province&.pst_rate
    end
  end

  def hst_amount
    calc_tax_amount hst_rate
  end

  def hst_rate
    if persisted?
      self[:hst_rate]
    else
      user&.province&.hst_rate
    end
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

  def update_tax_rates
    self[:gst_rate] = gst_rate
    self[:pst_rate] = pst_rate
    self[:hst_rate] = hst_rate
  end

  def calc_tax_amount(rate)
    if rate.nil?
      nil
    else
      subtotal * rate
    end
  end

  def default_user
    self.user ||= User.new
  end
end
