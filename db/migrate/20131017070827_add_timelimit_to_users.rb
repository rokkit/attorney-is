class AddTimelimitToUsers < ActiveRecord::Migration
  def change
    add_column :users, :start_access, :datetime
    add_column :users, :end_access, :datetime
  end
end
