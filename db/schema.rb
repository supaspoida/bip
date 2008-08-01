# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080501195343) do

  create_table "appearances", :force => true do |t|
    t.integer  "band_id",    :limit => 11
    t.integer  "show_id",    :limit => 11
    t.boolean  "headliner"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendances", :force => true do |t|
    t.integer  "user_id",    :limit => 11
    t.integer  "show_id",    :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bands", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.text     "biography"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.integer  "user_id",    :limit => 11, :null => false
    t.string   "title",                    :null => false
    t.string   "permalink"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "performances", :force => true do |t|
    t.integer  "song_id",    :limit => 11
    t.integer  "position",   :limit => 11
    t.text     "notes"
    t.boolean  "segue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "setlist_id", :limit => 11
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id",   :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :force => true do |t|
    t.integer  "user_id",    :limit => 11
    t.integer  "role_id",    :limit => 11
    t.string   "state",                    :default => "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "setlists", :force => true do |t|
    t.integer  "appearance_id",      :limit => 11
    t.integer  "user_id",            :limit => 11
    t.integer  "performances_count", :limit => 11, :default => 0
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", :force => true do |t|
    t.integer  "venue_id",     :limit => 11
    t.datetime "date"
    t.datetime "announced_at"
    t.time     "doors"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", :force => true do |t|
    t.integer  "band_id",    :limit => 11
    t.string   "name"
    t.text     "lyrics"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "remember_token"
    t.string   "crypted_password",          :limit => 40
    t.string   "password_reset_code",       :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "activation_code",           :limit => 40
    t.datetime "remember_token_expires_at"
    t.datetime "activated_at"
    t.datetime "deleted_at"
    t.string   "state",                                   :default => "passive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
