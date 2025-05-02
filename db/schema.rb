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

ActiveRecord::Schema[8.0].define(version: 2025_05_02_072344) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_administrators_on_email", unique: true
  end

  create_table "delivery_schedules", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "delivery_on", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_delivery_schedules_on_user_id"
  end

  create_table "food_set_items", force: :cascade do |t|
    t.bigint "food_id", null: false
    t.bigint "food_set_id", null: false
    t.integer "quantity", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id", "food_set_id"], name: "index_food_set_items_on_food_id_and_food_set_id", unique: true
    t.index ["food_set_id"], name: "index_food_set_items_on_food_set_id"
  end

  create_table "food_sets", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "price", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plan_id", null: false
    t.index ["plan_id"], name: "index_food_sets_on_plan_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.boolean "refrigerated", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.boolean "published", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plan_id", null: false
    t.string "postal_code", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "address_line1", null: false
    t.string "address_line2", null: false
    t.string "phone_number", null: false
    t.string "delivery_schedule_type", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["plan_id"], name: "index_users_on_plan_id"
  end

  add_foreign_key "delivery_schedules", "users"
  add_foreign_key "food_set_items", "food_sets"
  add_foreign_key "food_set_items", "foods"
  add_foreign_key "food_sets", "plans"
  add_foreign_key "users", "plans"
end
