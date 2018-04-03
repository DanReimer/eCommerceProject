class User < ApplicationRecord
  has_many :orders
  belongs_to :province
  validates :street, :city, :province, :postal_code, presence: true

  VALID_CA_POSTAL_CODE = /\A[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1}[ -]?\d{1}[A-Z]{1}\d{1}\z/i
  validates :postal_code, format: { with: VALID_CA_POSTAL_CODE }
  before_save { postal_code.upcase! }

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
end
