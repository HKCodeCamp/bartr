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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121026035405) do

  create_table "attachinary_files", :force => true do |t|
    t.integer  "attachinariable_id"
    t.string   "attachinariable_type"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "attachinary_files", ["attachinariable_type", "attachinariable_id", "scope"], :name => "by_scoped_parent"

  create_table "bookmarks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bookmarks", ["item_id"], :name => "index_bookmarks_on_item_id"
  add_index "bookmarks", ["user_id"], :name => "index_bookmarks_on_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["item_id"], :name => "index_comments_on_item_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "followers", :force => true do |t|
    t.integer  "followed_by_id"
    t.integer  "following_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "followers", ["followed_by_id"], :name => "index_followers_on_followed_by_id"
  add_index "followers", ["following_id"], :name => "index_followers_on_following_id"

  create_table "interests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "status",     :default => 0, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "interests", ["item_id"], :name => "index_interests_on_item_id"
  add_index "interests", ["status"], :name => "index_interests_on_status"
  add_index "interests", ["user_id"], :name => "index_interests_on_user_id"

  create_table "item_pms", :force => true do |t|
    t.integer  "item_id"
    t.integer  "sender_id"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "item_pms", ["item_id"], :name => "index_item_pms_on_item_id"
  add_index "item_pms", ["sender_id"], :name => "index_item_pms_on_sender_id"

  create_table "items", :force => true do |t|
    t.string   "title"
    t.text     "desc"
    t.string   "category"
    t.decimal  "price",      :precision => 11, :scale => 2
    t.string   "status"
    t.text     "tag"
    t.datetime "deleted_at"
    t.integer  "owner_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "buyer_id"
  end

  add_index "items", ["buyer_id"], :name => "index_items_on_buyer_id"

  create_table "places", :force => true do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "lng"
    t.text     "desc"
    t.integer  "owner_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                   :default => "", :null => false
    t.text     "desc",                   :default => "", :null => false
    t.string   "status",                 :default => "", :null => false
    t.text     "tag",                    :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "deleted_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "mobile_no",              :default => ""
    t.integer  "followers_count",        :default => 0,  :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["followers_count"], :name => "index_users_on_followers_count"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
