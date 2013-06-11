class ChangeTypeDatetimeFromMeeting < ActiveRecord::Migration
  def change
    change_column :meetings, :will_be_on, :date
    add_column :meetings, :will_be_at, :time
  end
end
