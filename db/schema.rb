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

ActiveRecord::Schema.define(version: 20150710014151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auctions", force: :cascade do |t|
    t.string   "auction_title"
    t.integer  "auction_status"
    t.string   "auction_desc"
    t.decimal  "auction_start_price"
    t.decimal  "auction_end_price"
    t.datetime "auction_start_date"
    t.datetime "auction_end_date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "seller_id"
    t.integer  "category_id"
    t.float    "longtitude"
    t.float    "latitude"
  end

  add_index "auctions", ["category_id"], name: "index_auctions_on_category_id", using: :btree
  add_index "auctions", ["seller_id"], name: "index_auctions_on_seller_id", using: :btree

  create_table "bids", force: :cascade do |t|
    t.decimal  "bid_price"
    t.integer  "bid_status"
    t.integer  "auction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "buyer_id"
  end

  add_index "bids", ["auction_id"], name: "index_bids_on_auction_id", using: :btree
  add_index "bids", ["buyer_id"], name: "index_bids_on_buyer_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parent_id"
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "auction_id"
    t.boolean  "private"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["auction_id"], name: "index_comments_on_auction_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bids", "auctions"
  add_foreign_key "comments", "auctions"
  add_foreign_key "comments", "users"
end
