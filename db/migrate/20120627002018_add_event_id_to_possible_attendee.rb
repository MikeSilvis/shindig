class AddEventIdToPossibleAttendee < ActiveRecord::Migration
  def change
  	add_column :possible_attendees, :event_id, :integer
  	# add_column :attendee_id, :attendee_id, :integer
  end
end
