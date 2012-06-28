class AddVisibleToPossibleAttendees < ActiveRecord::Migration
  def change
    add_column :possible_attendees, :visible, :boolean, default: true
  end
end
