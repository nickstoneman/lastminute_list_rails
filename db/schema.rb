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

ActiveRecord::Schema.define(version: 20150730143319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.boolean  "filled"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "customer_name"
    t.integer  "message_id"
    t.integer  "subscriber_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "sms_message_body"
    t.datetime "appointment_time"
    t.string   "claim_appointment_url"
    t.string   "appointment_discount"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "subscriber_phone_number"
    t.string   "subscriber_email"
    t.string   "subscriber_gender"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "customer_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "business_name"
    t.string   "business_logo"
    t.string   "business_address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
