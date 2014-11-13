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

ActiveRecord::Schema.define(version: 20141113074906) do

  create_table "answers", force: true do |t|
    t.integer  "question_id", null: false
    t.integer  "user_id",     null: false
    t.text     "content",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "banned_users", force: true do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
  end

  add_index "banned_users", ["user_id"], name: "index_banned_users_on_user_id"

  create_table "group_banned_users", force: true do |t|
    t.integer  "group_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
  end

  add_index "group_banned_users", ["group_id", "user_id"], name: "index_group_banned_users_on_group_id_and_user_id"

  create_table "group_members", force: true do |t|
    t.integer  "group_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
  end

  add_index "group_members", ["group_id"], name: "index_group_members_on_group_id"
  add_index "group_members", ["user_id"], name: "index_group_members_on_user_id"

  create_table "groups", force: true do |t|
    t.integer  "user_id",     null: false
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id"

  create_table "questions", force: true do |t|
    t.integer  "group_id",   null: false
    t.integer  "user_id",    null: false
    t.string   "title",      null: false
    t.text     "content",    null: false
    t.integer  "anonymous",  null: false
    t.datetime "created_at", null: false
  end

  add_index "questions", ["group_id"], name: "index_questions_on_group_id"
  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

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
