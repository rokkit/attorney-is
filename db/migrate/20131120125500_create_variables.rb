class CreateVariables < ActiveRecord::Migration
  def change
    create_table :variables do |t|
      t.string :name, null: false
      t.string :value, null: false

      t.timestamps
    end
  end
end
