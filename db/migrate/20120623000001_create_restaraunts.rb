class CreateRestaraunts < ActiveRecord::Migration
  def change
    create_table :restaraunts do |t|
      t.string   "name"
      t.integer  "ls_id"
      t.string   "address"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
      t.string   "lat"
      t.string   "long"
      t.string   "venue_id"
      t.timestamps
    end
  end
end