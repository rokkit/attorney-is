class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :attorney_formation, :string
    add_column :users, :attorney_consult, :string
  end
end
