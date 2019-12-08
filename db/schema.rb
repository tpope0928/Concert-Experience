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

ActiveRecord::Schema.define(version: 2019_12_08_193337) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "concerts", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "venue"
    t.date "date"
    t.integer "artist_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_concerts_on_artist_id"
    t.index ["user_id"], name: "index_concerts_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.integer "rating"
    t.string "content"
    t.integer "user_id", null: false
    t.integer "concert_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["concert_id"], name: "index_experiences_on_concert_id"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "concerts", "artists"
  add_foreign_key "concerts", "users"
  add_foreign_key "experiences", "concerts"
  add_foreign_key "experiences", "users"
end
