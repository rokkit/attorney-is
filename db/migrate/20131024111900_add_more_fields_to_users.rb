class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :number_certificate, :integer
    add_column :users, :firstname, :string
    add_column :users, :secondname, :string
    add_column :users, :lastname, :string
  end
end
