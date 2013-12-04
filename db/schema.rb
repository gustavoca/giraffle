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

ActiveRecord::Schema.define(version: 20131204192249) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

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
    t.integer  "members_count",   default: 0
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
