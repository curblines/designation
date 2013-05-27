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

ActiveRecord::Schema.define(:version => 20130526230629) do

  create_table "exhibits", :force => true do |t|
    t.text     "attribution"
    t.text     "description"
    t.datetime "inception"
    t.string   "medium"
    t.string   "uri"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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
    t.string   "slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "summary"
  end

end
