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

ActiveRecord::Schema.define(version: 20160000000001) do

  create_table "box_details", force: :cascade do |t|
    t.integer  "giftbox_id", limit: 4, null: false
    t.integer  "product_id", limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "box_details", ["giftbox_id"], name: "index_box_details_on_giftbox_id", using: :btree
  add_index "box_details", ["product_id"], name: "index_box_details_on_product_id", using: :btree

  create_table "boxes", force: :cascade do |t|
    t.integer  "capacity",   limit: 4,   null: false
    t.string   "box_type",   limit: 255, null: false
    t.integer  "price",      limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "giftboxes", force: :cascade do |t|
    t.integer  "box_id",     limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "product_id",  limit: 4,     null: false
    t.integer  "user_id",     limit: 4,     null: false
    t.integer  "wrapping_id", limit: 4,     null: false
    t.text     "dest",        limit: 65535, null: false
    t.string   "zipcode",     limit: 255,   null: false
    t.string   "payment",     limit: 255,   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.integer  "product_id",  limit: 4, null: false
    t.integer  "category_id", limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "product_categories", ["category_id"], name: "index_product_categories_on_category_id", using: :btree
  add_index "product_categories", ["product_id"], name: "index_product_categories_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",       limit: 255,   null: false
    t.integer  "price",      limit: 4,     null: false
    t.integer  "weight",     limit: 4,     null: false
    t.integer  "stock",      limit: 4,     null: false
    t.text     "note",       limit: 65535, null: false
    t.string   "image",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "rules", force: :cascade do |t|
    t.integer "category_id1", limit: 4, null: false
    t.integer "category_id2", limit: 4, null: false
  end

  add_index "rules", ["category_id1"], name: "index_rules_on_category_id1", using: :btree
  add_index "rules", ["category_id2"], name: "index_rules_on_category_id2", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255,                 null: false
    t.boolean  "administrator",               default: false, null: false
    t.string   "password_digest", limit: 255,                 null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "wrappings", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
