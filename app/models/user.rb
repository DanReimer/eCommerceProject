class User < ApplicationRecord

  belongs_to :province
  validates :street, :city, :province, presence: true

  # Username is case insensitive TODO: not sure if I want this
  # before_save { self.username.downcase! }

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, on: :create
end
