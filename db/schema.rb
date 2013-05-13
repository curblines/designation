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

ActiveRecord::Schema.define(:version => 20130512235022) do

  create_table "exhibits", :force => true do |t|
    t.text     "attribution"
    t.text     "description"
    t.datetime "inception"
    t.string   "medium"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "uri"
  end

  create_table "exhibits_landmarks", :id => false, :force => true do |t|
    t.integer "exhibit_id"
    t.integer "landmark_id"
  end

  add_index "exhibits_landmarks", ["exhibit_id", "landmark_id"], :name => "index_exhibits_landmarks_on_exhibit_id_and_landmark_id"

  create_table "landmarks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "lpc_type"
    t.text     "tags"
    t.text     "founders"
    t.float    "lat"
    t.float    "lng"
    t.datetime "inception"
    t.datetime "designation"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "users", :force => true do |t|
    t.text     "name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end