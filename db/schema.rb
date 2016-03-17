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

ActiveRecord::Schema.define(version: 20160316235818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "legislators", force: :cascade do |t|
    t.string "twitter_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "screen_name"
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "avatar"
  end

  create_table "zipcodes", force: :cascade do |t|
    t.string   "postal_code"
    t.string   "place_name"
    t.string   "state"
    t.string   "state_abbreviation"
    t.string   "county"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
