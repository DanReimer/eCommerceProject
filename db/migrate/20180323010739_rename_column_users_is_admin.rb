class RenameColumnUsersIsAdmin < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :is_admin?, :admin
  end
end
