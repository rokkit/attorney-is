class AddChangePasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :change_password, :boolean
  end
end
