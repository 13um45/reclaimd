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

ActiveRecord::Schema.define(version: 20151216210118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "admins", ["username"], name: "index_admins_on_username", unique: true, using: :btree

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
  end

end
