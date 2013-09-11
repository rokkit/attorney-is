class AddFieldsToDomains < ActiveRecord::Migration
  def change
    add_column :domains, :address, :text
    add_column :domains, :phone, :string
  end
end
