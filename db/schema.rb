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

ActiveRecord::Schema.define(version: 20171213180011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.integer "vote_count", default: 0, null: false
    t.bigint "pets_media_link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pets_media_link_id"], name: "index_entries_on_pets_media_link_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "contestant_1_entry_id", null: false
    t.integer "contestant_2_entry_id"
    t.bigint "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_matches_on_round_id"
  end

  create_table "media_links", force: :cascade do |t|
    t.bigint "user_id"
    t.string "link"
    t.string "link_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_media_links_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.string "breed", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_pic"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "pets_media_links", force: :cascade do |t|
    t.bigint "media_link_id"
    t.bigint "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_link_id"], name: "index_pets_media_links_on_media_link_id"
    t.index ["pet_id"], name: "index_pets_media_links_on_pet_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.string "name"
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_rounds_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "theme", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "f_name", default: "", null: false
    t.string "l_name", default: "", null: false
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_pic"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vote_checks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_vote_checks_on_match_id"
    t.index ["user_id"], name: "index_vote_checks_on_user_id"
  end

end
