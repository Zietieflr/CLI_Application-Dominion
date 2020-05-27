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

ActiveRecord::Schema.define(version: 2020_05_27_005035) do

  create_table "cards", force: :cascade do |t|
    t.string "card_name"
    t.integer "set_number"
    t.string "set_name"
    t.string "type_of_card"
    t.boolean "is_kingdom_card"
    t.string "cost"
    t.string "card_text"
  end

end
