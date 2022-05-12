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

ActiveRecord::Schema.define(version: 2022_05_12_192058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "outpatient_clinics", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "rank"
    t.boolean "radiology"
    t.boolean "pediatrics"
    t.boolean "womens_health"
    t.boolean "referrals"
    t.integer "clinic_services_provided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.boolean "doctor"
    t.integer "review_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "outpatient_clinic_id"
    t.index ["outpatient_clinic_id"], name: "index_providers_on_outpatient_clinic_id"
  end

  add_foreign_key "providers", "outpatient_clinics"
end
