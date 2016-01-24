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

ActiveRecord::Schema.define(version: 20160124032528) do

  create_table "friends", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "uid",        limit: 8
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
  end

  add_index "friends", ["uid"], name: "index_friends_on_uid", using: :btree

  create_table "saved_images", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "image_url",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "uid",                limit: 8
    t.text     "body",               limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "media_file_name",    limit: 255
    t.string   "media_content_type", limit: 255
    t.integer  "media_file_size",    limit: 4
    t.datetime "media_updated_at"
    t.string   "post_name",          limit: 255
  end

  add_index "tweets", ["uid"], name: "index_tweets_on_uid", using: :btree
  add_index "tweets", ["user_id"], name: "index_tweets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",      limit: 255
    t.string   "uid",           limit: 255
    t.string   "name",          limit: 255
    t.string   "token",         limit: 255
    t.string   "secret",        limit: 255
    t.string   "profile_image", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
