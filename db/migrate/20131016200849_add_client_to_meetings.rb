class AddClientToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :client, :text
  end
end
