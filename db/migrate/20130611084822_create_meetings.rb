class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title
      t.text :content
      t.datetime :will_be_on
      t.references :user
      t.integer :status

      t.timestamps
    end
  end
end
