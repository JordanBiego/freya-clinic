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

ActiveRecord::Schema[7.0].define(version: 2022_11_15_192621) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adresses", force: :cascade do |t|
    t.integer "postal_code", null: false
    t.string "street", null: false
    t.string "complement"
    t.string "district", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.integer "ibge_code"
    t.bigint "municipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipe_id"], name: "index_adresses_on_municipe_id"
  end

  create_table "municipes", force: :cascade do |t|
    t.string "name", null: false
    t.integer "cpf", null: false
    t.integer "cns", null: false
    t.string "email", null: false
    t.date "birthdate", null: false
    t.integer "phone", null: false
    t.string "picture", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "adresses", "municipes"
end
