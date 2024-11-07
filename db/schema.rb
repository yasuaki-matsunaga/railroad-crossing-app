# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_11_05_053430) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", primary_key: "city_id", id: :serial, force: :cascade do |t|
    t.string "city_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crossing_cities", id: false, force: :cascade do |t|
    t.bigint "crossing_id"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crossing_prefectures", id: false, force: :cascade do |t|
    t.bigint "crossing_id"
    t.integer "prefecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crossing_railways", id: false, force: :cascade do |t|
    t.bigint "crossing_id"
    t.bigint "railway_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crossings", primary_key: "crossing_id", force: :cascade do |t|
    t.decimal "latitude", precision: 11, scale: 8, null: false
    t.decimal "longitude", precision: 11, scale: 8, null: false
    t.string "crossing_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", primary_key: "prefecture_id", id: :serial, force: :cascade do |t|
    t.string "prefecture_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railways", primary_key: "railway_id", force: :cascade do |t|
    t.string "railway_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "crossing_cities", "cities", primary_key: "city_id"
  add_foreign_key "crossing_cities", "crossings", primary_key: "crossing_id"
  add_foreign_key "crossing_prefectures", "crossings", primary_key: "crossing_id"
  add_foreign_key "crossing_prefectures", "prefectures", primary_key: "prefecture_id"
  add_foreign_key "crossing_railways", "crossings", primary_key: "crossing_id"
  add_foreign_key "crossing_railways", "railways", primary_key: "railway_id"
end
