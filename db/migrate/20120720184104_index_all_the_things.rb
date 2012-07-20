class IndexAllTheThings < ActiveRecord::Migration
  def change
    add_index :attendees, :user_id
    add_index :attendees, :event_id
    add_index :attendees, :menu_id
    add_index :attendees, :possible_time_id

    add_index :authentications, :user_id
    add_index :authentications, :provider

    add_index :events, :user_id

    add_index :items, :category_id
    add_index :items, :event_id
    add_index :items, :user_id

    add_index :menus, :restaraunt_id
    add_index :menus, :event_id

    add_index :messages, :user_id
    add_index :messages, :event_id

    add_index :possible_attendees, :possible_time_id
    add_index :possible_attendees, :user_id
    add_index :possible_attendees, :event_id
    add_index :possible_attendees, :visible

    add_index :possible_times, :event_id

    add_index :restaraunts, :ls_id
    add_index :restaraunts, :venue_id

    add_index :tweeps, :user_id
  end
end
