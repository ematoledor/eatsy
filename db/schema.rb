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

ActiveRecord::Schema.define(version: 2020_06_23_231559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.bigint "recipe_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_category_id"], name: "index_categories_on_recipe_category_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.bigint "portion_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["portion_id"], name: "index_ingredients_on_portion_id"
  end

  create_table "list_recipes", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_id"], name: "index_list_recipes_on_list_id"
    t.index ["recipe_id"], name: "index_list_recipes_on_recipe_id"
  end

  create_table "lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "portions", force: :cascade do |t|
    t.integer "unit"
    t.integer "amount"
    t.string "friendly_description"
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_portions_on_recipe_id"
  end

  create_table "recipe_categories", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_recipe_categories_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.string "instructions"
    t.integer "prep_time"
    t.boolean "vegetarian"
    t.boolean "vegan"
    t.boolean "gluten_free"
    t.boolean "dairy_free"
    t.boolean "very_healthy"
    t.boolean "cheap"
    t.boolean "very_popular"
    t.boolean "ketogenic"
    t.integer "servings"
    t.string "source_id"
    t.string "image"
    t.string "summary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "description"
    t.bigint "recipe_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_reviews_on_recipe_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
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

  add_foreign_key "categories", "recipe_categories"
  add_foreign_key "ingredients", "portions"
  add_foreign_key "list_recipes", "lists"
  add_foreign_key "list_recipes", "recipes"
  add_foreign_key "lists", "users"
  add_foreign_key "portions", "recipes"
  add_foreign_key "recipe_categories", "recipes"
  add_foreign_key "reviews", "recipes"
  add_foreign_key "reviews", "users"
end
