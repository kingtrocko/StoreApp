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

ActiveRecord::Schema.define(version: 20150204143634) do

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "provider_id"
    t.integer  "parent_id"
    t.integer  "product_count"
    t.string   "description"
    t.boolean  "has_children"
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  add_index "categories", ["provider_id"], name: "index_categories_on_provider_id", using: :btree

  create_table "categories_products", id: false, force: true do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories_products", ["category_id"], name: "index_categories_products_on_category_id", using: :btree
  add_index "categories_products", ["product_id"], name: "index_categories_products_on_product_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "store_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.string   "city"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "product_units", force: true do |t|
    t.integer  "product_id"
    t.integer  "unit_id"
    t.decimal  "price",       precision: 8, scale: 2
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
  end

  add_index "product_units", ["product_id"], name: "index_product_units_on_product_id", using: :btree
  add_index "product_units", ["unit_id"], name: "index_product_units_on_unit_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "provider_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "product_code"
  end

  add_index "products", ["provider_id"], name: "index_products_on_provider_id", using: :btree

  create_table "providers", force: true do |t|
    t.string   "company_name"
    t.string   "contact_first_name"
    t.string   "contact_last_name"
    t.string   "city"
    t.string   "phone"
    t.string   "email"
    t.string   "logo_url"
    t.string   "website"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "provider_id"
  end

  add_index "units", ["provider_id"], name: "index_units_on_provider_id", using: :btree

end
