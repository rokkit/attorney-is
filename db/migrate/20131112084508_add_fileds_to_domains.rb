class AddFiledsToDomains < ActiveRecord::Migration
  def change
    add_column :domains, :email, :string
    add_column :domains, :city, :string
    add_column :domains, :fio_major, :string
  end
end
