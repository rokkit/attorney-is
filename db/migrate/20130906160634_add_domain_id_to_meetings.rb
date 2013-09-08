class AddDomainIdToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :domain_id, :integer
  end
end
