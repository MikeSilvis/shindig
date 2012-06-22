class CreatePossibleTimes < ActiveRecord::Migration
  def change
    create_table :possible_times do |t|
      t.integer :event_id
      t.datetime :time_start
      t.datetime :time_end

      t.timestamps
    end
  end
end
