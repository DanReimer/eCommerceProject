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

  belongs_to :province

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }

  # Username is case insensitive
  before_save { self.username.downcase! }
  has_secure_password
end
