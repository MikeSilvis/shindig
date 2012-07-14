class AddOwnerToAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :owner, :boolean, default: false
  end
end
