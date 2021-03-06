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

ActiveRecord::Schema.define(version: 2019_01_22_183649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "houses", force: :cascade do |t|
    t.string "number"
    t.string "address"
    t.text "route"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "document"
    t.string "phone"
    t.bigint "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_people_on_house_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "species"
    t.string "breed"
    t.string "color"
    t.string "gender"
    t.string "size"
    t.bigint "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["house_id"], name: "index_pets_on_house_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "plate"
    t.string "brand"
    t.string "model"
    t.string "color"
    t.integer "year"
    t.bigint "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_vehicles_on_house_id"
  end

  create_table "visits", force: :cascade do |t|
    t.string "contract_type"
    t.string "work_days"
    t.date "enter_date"
    t.date "leave_date"
    t.bigint "house_id"
    t.bigint "person_id"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_visits_on_house_id"
    t.index ["person_id"], name: "index_visits_on_person_id"
    t.index ["vehicle_id"], name: "index_visits_on_vehicle_id"
  end

  add_foreign_key "people", "houses"
  add_foreign_key "pets", "houses"
  add_foreign_key "vehicles", "houses"
  add_foreign_key "visits", "houses"
  add_foreign_key "visits", "people"
  add_foreign_key "visits", "vehicles"
end
