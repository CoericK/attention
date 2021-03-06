# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_12_113313) do

  create_table "ads", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.decimal "cpm", precision: 16, scale: 8, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.decimal "distance", precision: 8, scale: 2, default: "0.0"
    t.decimal "balance", precision: 16, scale: 8, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rotations", force: :cascade do |t|
    t.integer "device_id", null: false
    t.integer "ad_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ad_id"], name: "index_rotations_on_ad_id"
    t.index ["device_id"], name: "index_rotations_on_device_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.integer "device_id", null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_tracks_on_device_id"
  end

  add_foreign_key "rotations", "ads"
  add_foreign_key "rotations", "devices"
  add_foreign_key "tracks", "devices"
end
