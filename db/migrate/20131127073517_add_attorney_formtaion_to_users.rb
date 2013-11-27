class AddAttorneyFormtaionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :attorney_formation_id, :integer
  end
end
