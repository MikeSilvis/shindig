class CreatePossibleAttendees < ActiveRecord::Migration
  def change
    create_table :possible_attendees do |t|
      t.integer :possible_time_id
      t.integer :user_id
      t.timestamps
    end
  end
end
