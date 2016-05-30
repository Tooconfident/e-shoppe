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

ActiveRecord::Schema.define(version: 20160525212906) do

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "purchased",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_products", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "category_products", ["category_id"], name: "index_category_products_on_category_id"
  add_index "category_products", ["product_id"], name: "index_category_products_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "order_qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["cart_id"], name: "index_orders_on_cart_id"
  add_index "orders", ["product_id"], name: "index_orders_on_product_id"

  create_table "products", force: :cascade do |t|
    t.string   "img",         default: "http://www.flexson.com/media/catalog/product/placeholder/default/No_available_image.gif"
    t.string   "description"
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at",                                                                                                      null: false
    t.datetime "updated_at",                                                                                                      null: false
    t.integer  "quantity"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_admin",        default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
