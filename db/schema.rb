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

ActiveRecord::Schema.define(:version => 20110804030913) do

  create_table "Mercibokus", :force => true do |t|
    t.integer  "thanker_id"
    t.integer  "welcomer_id"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "headline"
  end

  add_index "Mercibokus", ["thanker_id", "welcomer_id"], :name => "index_thankyous_on_thanker_id_and_welcomer_id"
  add_index "Mercibokus", ["thanker_id"], :name => "index_thankyous_on_thanker_id"
  add_index "Mercibokus", ["welcomer_id", "thanker_id"], :name => "index_mercibokus_on_welcomer_id_and_thanker_id"
  add_index "Mercibokus", ["welcomer_id"], :name => "index_thankyous_on_welcomer_id"

  create_table "attachments", :force => true do |t|
    t.integer "merciboku_id"
    t.string  "filename"
    t.string  "mimetype"
    t.integer "bytecount"
    t.binary  "bytes"
  end

  create_table "bonds", :force => true do |t|
    t.integer  "submissive_id"
    t.integer  "dominant_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "bonds", ["dominant_id"], :name => "index_bonds_on_dominant_id"
  add_index "bonds", ["submissive_id", "dominant_id"], :name => "index_bonds_on_submissive_id_and_dominant_id", :unique => true
  add_index "bonds", ["submissive_id"], :name => "index_bonds_on_submissive_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",                                   :null => false
    t.string   "encrypted_password",     :default => "",                                   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "reconfirmable"
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
    t.string   "name"
    t.string   "subdomain"
    t.string   "welcome_phrase",         :default => "These people dig me:"
    t.string   "thankyou_phrase",        :default => "I give much props to these people:"
    t.boolean  "admin",                  :default => false
    t.string   "calendar"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["subdomain"], :name => "index_users_on_subdomain", :unique => true

end
