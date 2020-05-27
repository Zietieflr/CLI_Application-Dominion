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

ActiveRecord::Schema.define(version: 2020_05_27_161846) do

  create_table "cards", force: :cascade do |t|
    t.string "card_name"
    t.integer "set_number"
    t.string "set_name"
    t.string "type_of_card"
    t.boolean "is_kingdom_card"
    t.string "cost"
    t.string "card_text"
  end

  create_table "favorite_cards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "card_id"
    t.index ["card_id"], name: "index_favorite_cards_on_card_id"
    t.index ["user_id"], name: "index_favorite_cards_on_user_id"
  end

  create_table "kingdom_card_sets", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "card_id"
    t.index ["card_id"], name: "index_kingdom_card_sets_on_card_id"
    t.index ["user_id"], name: "index_kingdom_card_sets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
  end

  add_foreign_key "favorite_cards", "cards"
  add_foreign_key "favorite_cards", "users"
  add_foreign_key "kingdom_card_sets", "cards"
  add_foreign_key "kingdom_card_sets", "users"
end
