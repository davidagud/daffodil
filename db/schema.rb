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

ActiveRecord::Schema.define(version: 2019_05_29_140411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flowers", force: :cascade do |t|
    t.string "flower_name"
    t.decimal "quantity", precision: 8, scale: 2
    t.bigint "recipe_id"
    t.decimal "flower_price", precision: 8, scale: 2
    t.decimal "flower_total_price", precision: 8, scale: 2
    t.string "flower_vendor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_flowers_on_recipe_id"
  end

  create_table "hard_goods", force: :cascade do |t|
    t.string "hard_good_name"
    t.decimal "hard_good_quantity", precision: 8, scale: 2
    t.decimal "hard_good_price", precision: 8, scale: 2
    t.decimal "hard_good_total_price", precision: 8, scale: 2
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_hard_goods_on_recipe_id"
  end

  create_table "masterflowers", force: :cascade do |t|
    t.string "masterflower_name"
    t.decimal "masterflower_price", precision: 8, scale: 2
    t.string "vendor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "wedding_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["wedding_id"], name: "index_order_items_on_wedding_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "recipe_name"
    t.string "recipe_ingredient"
    t.integer "recipe_quantity"
    t.decimal "recipe_total_price", precision: 8, scale: 2
    t.decimal "retail_price", precision: 8, scale: 2
    t.text "notes"
    t.bigint "wedding_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wedding_id"], name: "index_recipes_on_wedding_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "weddings", force: :cascade do |t|
    t.string "wedding_name"
    t.date "wedding_date"
    t.boolean "completed"
    t.decimal "total_price", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "order_items", "orders", on_delete: :cascade
  add_foreign_key "order_items", "weddings", on_delete: :cascade
end
