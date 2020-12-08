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

ActiveRecord::Schema.define(version: 2020_12_07_045117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "account_name"
    t.string "account_type"
    t.string "account_number"
    t.boolean "account_active"
    t.string "company_name"
    t.string "reg_number"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street_number"
    t.string "street_name"
    t.string "suburb"
    t.string "zipcode"
    t.string "state"
    t.string "country"
    t.integer "user_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", force: :cascade do |t|
    t.string "bank_location"
    t.string "bank_code"
    t.string "bank_name"
    t.string "account_number"
    t.string "account_name"
    t.string "provider_account_id"
    t.string "provider_id"
    t.string "transfercode_type"
    t.string "transfercode_id"
    t.date "last_verified"
    t.integer "user_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beneficiaries", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "mobile_number"
    t.string "relationship"
    t.string "level"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investments", force: :cascade do |t|
    t.float "invest_amount"
    t.integer "invest_share"
    t.float "trxn_fee"
    t.float "total_due"
    t.boolean "split_pay"
    t.string "trxn_ref"
    t.string "trxn_code"
    t.string "trxn_status"
    t.string "trxn_message"
    t.string "pay_method"
    t.integer "property_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "prop_id"
    t.string "status"
    t.string "name"
    t.string "address"
    t.string "region"
    t.float "value"
    t.string "currency"
    t.integer "total_shares"
    t.integer "available_shares"
    t.integer "min_shares"
    t.text "description"
    t.string "prop_type"
    t.string "prop_image"
    t.integer "bed"
    t.integer "bath"
    t.integer "plot_size"
    t.integer "car_park"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "email"
    t.string "mobile_number"
    t.string "dial_code"
    t.string "document_id"
    t.string "document_type"
    t.date "expiry_date"
    t.boolean "validated"
    t.string "issue_country"
    t.string "password_digest"
    t.string "reset_password_token"
    t.date "reset_password_expires"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
