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

ActiveRecord::Schema.define(version: 20131120212402) do

  create_table "event_sets", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.integer  "interval"
    t.integer  "organizers_per_event"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_sets", ["group_id"], name: "index_event_sets_on_group_id"

  create_table "event_sets_members", id: false, force: true do |t|
    t.integer  "event_set_id", null: false
    t.integer  "member_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_sets_members", ["event_set_id", "member_id"], name: "index_event_sets_members_on_event_set_id_and_member_id", unique: true

  create_table "events", force: true do |t|
    t.date     "date"
    t.integer  "event_set_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
  end

  add_index "events", ["event_set_id"], name: "index_events_on_event_set_id"

  create_table "events_members", force: true do |t|
    t.integer  "event_id",   null: false
    t.integer  "member_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events_members", ["event_id", "member_id"], name: "index_events_members_on_event_id_and_member_id", unique: true

  create_table "groups", force: true do |t|
    t.string   "group_id"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["group_id"], name: "index_members_on_group_id"

end
