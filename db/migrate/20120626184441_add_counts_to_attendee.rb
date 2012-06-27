class AddCountsToAttendee < ActiveRecord::Migration
  def change
    add_column :attendees,  :menu_id, :integer
  end
end
