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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160307210932) do

  create_table "event_artists", force: :cascade do |t|
    t.string   "artist_uri"
    t.string   "artist_name"
    t.integer  "artist_id"
    t.string   "performance_name"
    t.integer  "billing_index"
    t.integer  "performance_id"
    t.string   "billing"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "songkick_event_id"
    t.integer  "event_id"
  end

  add_index "event_artists", ["event_id"], name: "index_event_artists_on_event_id"

  create_table "events", force: :cascade do |t|
    t.integer  "songkick_event_id"
    t.string   "event_type"
    t.string   "uri"
    t.string   "event_name"
    t.datetime "start_time"
    t.datetime "start_date"
    t.datetime "start_datetime"
    t.string   "city"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "venue_id"
    t.string   "venue_name"
    t.string   "venue_uri"
    t.float    "venue_longitude"
    t.float    "venue_latitude"
    t.string   "venue_metro_uri"
    t.string   "venue_metro_name"
    t.string   "venue_metro_country_name"
    t.integer  "venue_metro_id"
    t.string   "venue_metro_state_name"
    t.float    "popularity"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "address"
  end

  add_index "events", ["songkick_event_id"], name: "index_events_on_songkick_event_id", unique: true

  create_table "pregame_to_users", force: :cascade do |t|
    t.integer  "pregame_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pregames", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "place"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.text     "special"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prejam_spots", force: :cascade do |t|
    t.integer  "pregame_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
