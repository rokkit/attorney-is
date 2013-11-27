class RemoveAttorneyFormationFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :attorney_formation
  end

  def down
    add_column :users, :attorney_formation, :string
  end
end
