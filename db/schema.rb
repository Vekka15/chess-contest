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

ActiveRecord::Schema.define(version: 20160528135421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "duels", force: :cascade do |t|
    t.integer  "win_type_one"
    t.integer  "win_type_two"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "tournament_id"
    t.integer  "user_one_id"
    t.integer  "user_two_id"
  end

  add_index "duels", ["tournament_id"], name: "index_duels_on_tournament_id", using: :btree

  create_table "participations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tournament_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "participations", ["tournament_id"], name: "index_participations_on_tournament_id", using: :btree
  add_index "participations", ["user_id"], name: "index_participations_on_user_id", using: :btree

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "time"
    t.integer  "participation_limit"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "street"
    t.string   "city"
    t.date     "deadline"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "full_street_address"
  end

  add_index "tournaments", ["user_id"], name: "index_tournaments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "duels", "tournaments"
  add_foreign_key "participations", "tournaments"
  add_foreign_key "participations", "users"
  add_foreign_key "tournaments", "users"
end
