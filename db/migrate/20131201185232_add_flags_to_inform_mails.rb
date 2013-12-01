class AddFlagsToInformMails < ActiveRecord::Migration
  def change
    add_column :inform_mails, :sms, :boolean
    add_column :inform_mails, :email, :boolean
  end
end
