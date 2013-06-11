class CreateRequestMeetings < ActiveRecord::Migration
  def change
    create_table :request_meetings do |t|
      t.references :user
      t.references :meeting
      t.integer :status

      t.timestamps
    end
    add_index :request_meetings, :user_id
    add_index :request_meetings, :meeting_id
  end
end
