class AddDatesToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :start_date, :datetime
    add_column :roles, :end_date, :datetime
  end
end
