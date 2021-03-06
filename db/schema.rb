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

ActiveRecord::Schema.define(version: 20151217225719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "admins", ["username"], name: "index_admins_on_username", unique: true, using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "unit_price"
    t.integer  "quantity"
    t.integer  "total_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "subtotal"
    t.integer  "tax"
    t.integer  "shipping"
    t.integer  "total"
    t.integer  "order_status_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.boolean  "tops"
    t.boolean  "bottoms"
    t.boolean  "outerwear"
    t.boolean  "shoes"
    t.boolean  "bags"
    t.boolean  "jewelry"
    t.boolean  "mens"
    t.boolean  "womens"
    t.boolean  "unisex"
    t.boolean  "xs"
    t.boolean  "s"
    t.boolean  "m"
    t.boolean  "l"
    t.boolean  "xl"
    t.boolean  "obsidian"
    t.boolean  "onyx"
    t.boolean  "alabaster"
    t.boolean  "slate"
    t.boolean  "heather"
    t.boolean  "silver"
    t.boolean  "pattern"
    t.integer  "quantity"
    t.integer  "price"
    t.string   "brand"
    t.string   "material"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.integer  "admin_id"
    t.boolean  "active"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "order_statuses"
end
