class AddSmsToInformMails < ActiveRecord::Migration
  def change
    add_column :inform_mails, :sms_body, :text
  end
end
