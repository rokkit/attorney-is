class AddFieldsToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :judge, :string
  end
end
