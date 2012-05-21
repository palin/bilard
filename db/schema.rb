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

ActiveRecord::Schema.define(:version => 20120521230000) do

  create_table "clubs", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "owner_id"
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "post_code"
    t.text     "description"
    t.integer  "table_count"
  end

  create_table "employees", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "club_id"
    t.integer  "owner_id"
    t.string   "name"
    t.string   "surname"
    t.string   "last_login"
    t.string   "last_logout"
  end

  create_table "owners", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.integer  "user_id"
    t.string   "surname"
    t.string   "token"
    t.string   "phone"
    t.integer  "club_count"
  end

  create_table "prices", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "club_id"
    t.text     "description"
    t.float    "price"
  end

  create_table "reservations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "table_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tables", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "club_id"
    t.integer  "owner_id"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "login"
    t.string   "name"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "persistence_token"
    t.string   "perishable_token"
    t.string   "encrypt_password"
    t.integer  "owner_id"
    t.integer  "role_id"
    t.string   "surname"
    t.datetime "birthday"
    t.string   "city"
    t.text     "description"
    t.integer  "best_club"
    t.string   "picture"
  end

end
