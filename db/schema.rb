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

ActiveRecord::Schema.define(version: 20181106193812) do

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
    t.boolean "access"
    t.integer "house_id"
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
    t.boolean "access"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_pets_on_house_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "plate"
    t.string "brand"
    t.string "model"
    t.string "color"
    t.integer "year"
    t.boolean "access"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_vehicles_on_house_id"
  end

  create_table "visits", force: :cascade do |t|
    t.string "contract_type"
    t.string "work_days"
    t.date "enter_date"
    t.date "leave_date"
    t.integer "house_id"
    t.integer "person_id"
    t.integer "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_visits_on_house_id"
    t.index ["person_id"], name: "index_visits_on_person_id"
    t.index ["vehicle_id"], name: "index_visits_on_vehicle_id"
  end

end
