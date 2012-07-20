# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120720184104) do

  create_table "attendees", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "possible_time_id"
    t.integer  "menu_id"
    t.boolean  "owner",            :default => false
  end

  add_index "attendees", ["event_id"], :name => "index_attendees_on_event_id"
  add_index "attendees", ["menu_id"], :name => "index_attendees_on_menu_id"
  add_index "attendees", ["possible_time_id"], :name => "index_attendees_on_possible_time_id"
  add_index "attendees", ["user_id"], :name => "index_attendees_on_user_id"

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
    t.string   "username"
    t.string   "avatar"
    t.string   "refresh_token"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "authentications", ["provider"], :name => "index_authentications_on_provider"
  add_index "authentications", ["user_id"], :name => "index_authentications_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "description"
    t.string   "street"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "city"
    t.string   "token"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "google_url"
  end

  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "quantity"
    t.integer  "category_id"
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "items", ["category_id"], :name => "index_items_on_category_id"
  add_index "items", ["event_id"], :name => "index_items_on_event_id"
  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "menus", :force => true do |t|
    t.integer  "restaraunt_id"
    t.integer  "event_id"
    t.integer  "liked",         :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "name"
  end

  add_index "menus", ["event_id"], :name => "index_menus_on_event_id"
  add_index "menus", ["restaraunt_id"], :name => "index_menus_on_restaraunt_id"

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "messages", ["event_id"], :name => "index_messages_on_event_id"
  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "possible_attendees", :force => true do |t|
    t.integer  "possible_time_id"
    t.integer  "user_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "permanent",        :default => true
    t.integer  "event_id"
    t.boolean  "visible",          :default => true
  end

  add_index "possible_attendees", ["event_id"], :name => "index_possible_attendees_on_event_id"
  add_index "possible_attendees", ["possible_time_id"], :name => "index_possible_attendees_on_possible_time_id"
  add_index "possible_attendees", ["user_id"], :name => "index_possible_attendees_on_user_id"
  add_index "possible_attendees", ["visible"], :name => "index_possible_attendees_on_visible"

  create_table "possible_times", :force => true do |t|
    t.integer  "event_id"
    t.datetime "time_start"
    t.datetime "time_end"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "possible_times", ["event_id"], :name => "index_possible_times_on_event_id"

  create_table "restaraunts", :force => true do |t|
    t.string   "name"
    t.integer  "ls_id"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "lat"
    t.string   "long"
    t.string   "venue_id"
  end

  add_index "restaraunts", ["ls_id"], :name => "index_restaraunts_on_ls_id"
  add_index "restaraunts", ["venue_id"], :name => "index_restaraunts_on_venue_id"

  create_table "tweeps", :force => true do |t|
    t.string   "username"
    t.string   "avatar"
    t.string   "name"
    t.integer  "user_id"
    t.integer  "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tweeps", ["user_id"], :name => "index_tweeps_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "name"
    t.string   "username"
    t.string   "avatar"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_tweeps", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tweep_id"
    t.integer  "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users_tweeps", ["user_id", "tweep_id"], :name => "index_users_tweeps_on_user_id_and_tweep_id"

end
