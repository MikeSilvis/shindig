class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :restaraunt_id
      t.integer :event_id
      t.integer :liked, default: 0

      t.timestamps
    end
  end
end
