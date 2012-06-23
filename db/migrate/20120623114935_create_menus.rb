class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :restaraunt_id
      t.string :event_id
      t.integer :liked, default: 0

      t.timestamps
    end
  end
end
