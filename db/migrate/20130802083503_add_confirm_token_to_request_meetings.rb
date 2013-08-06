class AddConfirmTokenToRequestMeetings < ActiveRecord::Migration
  def change
    add_column :request_meetings, :confirm_token, :string
  end
end
