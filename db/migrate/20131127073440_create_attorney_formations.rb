class CreateAttorneyFormations < ActiveRecord::Migration
  def change
    create_table :attorney_formations do |t|
      t.string :name
      t.string :phone
      t.text :address
      t.string :email
      t.string :site

      t.timestamps
    end
  end
end
