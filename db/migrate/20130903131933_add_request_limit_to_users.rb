class AddRequestLimitToUsers < ActiveRecord::Migration
  def change
    add_column :users, :request_limit, :integer, default: 3, null: false
  end
end
