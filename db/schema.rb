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

ActiveRecord::Schema.define(version: 20160824004950) do

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
    t.text     "steps"
    t.text     "tips"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
end
