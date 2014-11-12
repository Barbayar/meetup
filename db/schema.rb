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

ActiveRecord::Schema.define(version: 20141112124648) do

  create_table "groups", force: true do |t|
    t.integer  "user_id",     null: false
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
  end

  add_index "groups", ["user_id"], name: "index_groups_on_owner_id"

  create_table "users", force: true do |t|
    t.integer  "sid",        null: false
    t.integer  "uid",        null: false
    t.string   "name",       null: false
    t.string   "email"
    t.string   "avatar_url", null: false
    t.datetime "created_at", null: false
  end

  add_index "users", ["sid", "uid"], name: "index_users_on_sid_and_uid", unique: true

end
