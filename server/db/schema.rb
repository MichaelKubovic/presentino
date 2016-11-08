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

ActiveRecord::Schema.define(version: 20161106000410) do

  create_table "holidays", force: :cascade do |t|
    t.string   "label",      null: false
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label"], name: "index_holidays_on_label"
  end

  create_table "holidays_presents", id: false, force: :cascade do |t|
    t.integer "holiday_id"
    t.integer "present_id"
    t.index ["holiday_id"], name: "index_holidays_presents_on_holiday_id"
    t.index ["present_id"], name: "index_holidays_presents_on_present_id"
  end

  create_table "present_stores", force: :cascade do |t|
    t.integer  "present_id"
    t.decimal  "price",      null: false
    t.string   "url",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["present_id"], name: "index_present_stores_on_present_id"
    t.index ["price"], name: "index_present_stores_on_price"
  end

  create_table "presents", force: :cascade do |t|
    t.string   "label",        null: false
    t.decimal  "price",        null: false
    t.string   "sex",          null: false
    t.integer  "age_from",     null: false
    t.integer  "age_to",       null: false
    t.text     "description"
    t.boolean  "ml_generated"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["label"], name: "index_presents_on_label"
    t.index ["price"], name: "index_presents_on_price"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
