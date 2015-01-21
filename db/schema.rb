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

ActiveRecord::Schema.define(version: 20150121061534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.string   "division"
    t.string   "country",    default: "Bangladesh"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "incidents", force: :cascade do |t|
    t.string   "title"
    t.text     "details"
    t.string   "incident_type"
    t.integer  "total_victims"
    t.integer  "men_wounded"
    t.integer  "women_wounded"
    t.integer  "minor_wounded"
    t.integer  "men_dead"
    t.integer  "women_dead"
    t.integer  "minor_dead"
    t.integer  "district_id"
    t.string   "location"
    t.text     "references"
    t.text     "notes"
    t.date     "happened_on"
    t.time     "happened_at"
    t.integer  "approved_by_id"
    t.datetime "approved_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "incidents", ["district_id"], name: "index_incidents_on_district_id", using: :btree

  create_table "incidents_tags", force: :cascade do |t|
    t.integer "incident_id"
    t.integer "tag_id"
  end

  add_index "incidents_tags", ["incident_id"], name: "index_incidents_tags_on_incident_id", using: :btree
  add_index "incidents_tags", ["tag_id"], name: "index_incidents_tags_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "category"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "incidents", "districts"
end
