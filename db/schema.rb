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

ActiveRecord::Schema[7.1].define(version: 2025_03_18_113208) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendars", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "rating"
    t.bigint "recipe_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_comments_on_recipe_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "groceries", force: :cascade do |t|
    t.boolean "completed"
    t.string "note"
    t.bigint "meal_ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_ingredient_id"], name: "index_groceries_on_meal_ingredient_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "ingredient_name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_ingredients", force: :cascade do |t|
    t.float "portion"
    t.bigint "recipe_id"
    t.bigint "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_meal_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_meal_ingredients_on_recipe_id"
  end

  create_table "menus", force: :cascade do |t|
    t.date "date"
    t.integer "participants"
    t.string "cook_name"
    t.integer "menu_style"
    t.bigint "recipe_id"
    t.bigint "calendar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_id"], name: "index_menus_on_calendar_id"
    t.index ["recipe_id"], name: "index_menus_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "duration"
    t.string "description_easy"
    t.integer "duration_easy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_calendars", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "calendar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_id"], name: "index_user_calendars_on_calendar_id"
    t.index ["user_id"], name: "index_user_calendars_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "recipes"
  add_foreign_key "comments", "users"
  add_foreign_key "groceries", "meal_ingredients"
  add_foreign_key "meal_ingredients", "ingredients"
  add_foreign_key "meal_ingredients", "recipes"
  add_foreign_key "menus", "calendars"
  add_foreign_key "menus", "recipes"
  add_foreign_key "user_calendars", "calendars"
  add_foreign_key "user_calendars", "users"
end
