# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160828224016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "food_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.integer  "food_category_id"
    t.boolean  "vegetarian"
    t.boolean  "vegan"
    t.boolean  "celiac"
    t.boolean  "diabetic"
    t.integer  "calories"
    t.integer  "proteins"
    t.integer  "carbohydrates"
    t.integer  "fats"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "ingredients_per_recipes", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.integer  "recipe_id"
    t.integer  "amount"
    t.string   "unit"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.float    "stars"
    t.boolean  "validated"
    t.text     "description"
    t.boolean  "vegetarian"
    t.boolean  "vegan"
    t.boolean  "celiac"
    t.boolean  "diabetic"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "steps",       default: [],              array: true
    t.string   "tips",        default: [],              array: true
  end

  create_table "recipes_per_users", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "user_id"
    t.boolean  "favorite",   default: false
    t.boolean  "owned",      default: false
    t.integer  "vote"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "avatar"
    t.datetime "birthdate"
    t.string   "gender"
    t.boolean  "vegetarian"
    t.boolean  "vegan"
    t.boolean  "celiac"
    t.boolean  "diabetic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ingredients", "food_categories"
  add_foreign_key "ingredients_per_recipes", "ingredients"
  add_foreign_key "ingredients_per_recipes", "recipes"
  add_foreign_key "recipes_per_users", "recipes"
  add_foreign_key "recipes_per_users", "users"
end
