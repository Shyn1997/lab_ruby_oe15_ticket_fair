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

ActiveRecord::Schema.define(version: 2018_12_19_085845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bus_stations", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_bus_stations_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "types"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "license_plate"
    t.string "types"
    t.integer "seat_amount"
    t.integer "seat_form"
    t.bigint "garage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garage_id"], name: "index_coaches_on_garage_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.string "bus_stop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.string "types"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_districts_on_city_id"
  end

  create_table "garages", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "address"
    t.text "info"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seats", force: :cascade do |t|
    t.string "code"
    t.integer "types"
    t.bigint "coach_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_seats_on_coach_id"
  end

  create_table "stop_points", force: :cascade do |t|
    t.time "time_stop"
    t.integer "types"
    t.bigint "trip_id"
    t.bigint "bus_station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_station_id"], name: "index_stop_points_on_bus_station_id"
    t.index ["trip_id"], name: "index_stop_points_on_trip_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "customer_id"
    t.integer "status", default: 2
    t.string "code"
    t.bigint "seat_id"
    t.string "bus_stop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_tickets_on_customer_id"
    t.index ["seat_id"], name: "index_tickets_on_seat_id"
    t.index ["trip_id"], name: "index_tickets_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "time_start"
    t.datetime "time_finish"
    t.string "city_start"
    t.string "city_finish"
    t.bigint "coach_id"
    t.boolean "is_repeated"
    t.float "fare"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_trips_on_coach_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "phone_number"
    t.boolean "admin"
    t.bigint "garage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["garage_id"], name: "index_users_on_garage_id"
  end

  add_foreign_key "bus_stations", "cities"
  add_foreign_key "coaches", "garages"
  add_foreign_key "stop_points", "bus_stations"
  add_foreign_key "stop_points", "trips"
  add_foreign_key "tickets", "customers"
  add_foreign_key "tickets", "seats"
  add_foreign_key "tickets", "trips"
  add_foreign_key "trips", "coaches"
  add_foreign_key "users", "garages"
end
