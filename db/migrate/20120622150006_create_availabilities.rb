class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :user_id
      t.datetime :time_start
      t.datetime :time_end

      t.timestamps
    end
  end
end
