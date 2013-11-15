class AddSenderToInformMails < ActiveRecord::Migration
  def change
    add_column :inform_mails, :sender_id, :integer
  end
end
