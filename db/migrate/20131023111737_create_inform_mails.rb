class CreateInformMails < ActiveRecord::Migration
  def change
    create_table :inform_mails do |t|
      t.references :user
      t.text :body

      t.timestamps
    end
    add_index :inform_mails, :user_id
  end
end
