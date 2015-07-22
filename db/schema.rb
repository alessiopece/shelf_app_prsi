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

ActiveRecord::Schema.define(version: 20150720212846) do

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "year"
    t.string   "genre"
    t.integer  "shelf_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "books", ["shelf_id"], name: "index_books_on_shelf_id"

  create_table "feeds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "shelf_id"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "feeds", ["item_id"], name: "index_feeds_on_item_id"
  add_index "feeds", ["shelf_id"], name: "index_feeds_on_shelf_id"
  add_index "feeds", ["user_id"], name: "index_feeds_on_user_id"

  create_table "films", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "year"
    t.string   "genre"
    t.integer  "shelf_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "films", ["shelf_id"], name: "index_films_on_shelf_id"

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "year"
    t.string   "genre"
    t.integer  "shelf_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "games", ["shelf_id"], name: "index_games_on_shelf_id"

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.integer  "year"
    t.string   "genre"
    t.integer  "shelf_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items", ["shelf_id"], name: "index_items_on_shelf_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "shelves", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shelves", ["user_id", "created_at"], name: "index_shelves_on_user_id_and_created_at"
  add_index "shelves", ["user_id"], name: "index_shelves_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
