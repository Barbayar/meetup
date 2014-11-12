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

ActiveRecord::Schema.define(version: 20141112074146) do

  create_table "users", force: true do |t|
    t.integer "sid"
    t.integer "uid"
    t.string "name"
    t.string "email"
    t.string "avatar_url"
    t.datetime "created_at"
  end

  change_column_null :users, :sid, false
  change_column_null :users, :uid, false
  change_column_null :users, :name, false
  change_column_null :users, :avatar_url, false
  change_column_null :users, :created_at, false
  add_index :users, [:sid, :uid], unique: true

end
