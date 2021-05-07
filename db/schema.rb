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

ActiveRecord::Schema.define(version: 2021_05_07_142313) do

  create_table "parks", force: :cascade do |t|
    t.string "states"
    t.text "weather_info"
    t.text "direction_info"
    t.string "addresses"
    t.string "entrance_fees"
    t.string "topics"
    t.string "name"
    t.decimal "latitude"
    t.string "activities"
    t.string "operating_hours"
    t.string "url"
    t.decimal "longitude"
    t.string "contacts"
    t.string "entrance_passes"
    t.string "park_code"
    t.string "designation"
    t.string "images"
    t.string "full_name"
    t.integer "nps_park_id"
    t.string "directions_url"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trails", force: :cascade do |t|
    t.integer "park_id", null: false
    t.text "short_description"
    t.text "long_description"
    t.boolean "is_reservation_required"
    t.string "season"
    t.string "topics"
    t.string "time_of_day_description"
    t.text "location_description"
    t.text "pets_description"
    t.text "duration_description"
    t.decimal "latitude"
    t.text "activity_description"
    t.string "activities"
    t.string "url"
    t.decimal "longitude"
    t.text "reservation_description"
    t.boolean "are_pets_permitted"
    t.string "duration"
    t.string "related_organizations"
    t.string "location"
    t.string "fee_description"
    t.boolean "do_fees_apply"
    t.string "title"
    t.string "images"
    t.string "time_of_day"
    t.string "tags"
    t.string "season_description"
    t.integer "nps_things_to_do_id"
    t.boolean "are_pets_permitted_with_restrictions"
    t.string "age_description"
    t.string "related_parks"
    t.text "accessibility_information"
    t.string "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["park_id"], name: "index_trails_on_park_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "trails", "parks"
end
