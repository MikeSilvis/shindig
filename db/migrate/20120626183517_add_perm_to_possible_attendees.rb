class AddPermToPossibleAttendees < ActiveRecord::Migration
  def change
    add_column :possible_attendees, :permanent, :boolean, default: true
  end
end
