class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :encrypted_password
      t.boolean :is_admin?
      t.string :street
      t.string :city
      t.references :province, foreign_key: true

      t.timestamps
    end
  end
end
