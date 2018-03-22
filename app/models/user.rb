class User < ApplicationRecord
  # t.string "username"
  # t.string "password_digest"
  # t.boolean "is_admin?"
  # t.string "street"
  # t.string "city"
  # t.integer "province_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.index ["province_id"], name: "index_users_on_province_id"

  belongs_to :province, optional: true

  # Username is case insensitive TODO: not sure if I want this
  # before_save { self.username.downcase! }

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
end
