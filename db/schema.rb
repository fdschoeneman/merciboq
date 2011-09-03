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

ActiveRecord::Schema.define(:version => 20110804030905) do

  create_table "attachments", :force => true do |t|
    t.integer "thankyou_id"
    t.string  "filename"
    t.string  "mimetype"
    t.integer "bytecount"
    t.binary  "bytes"
  end

  add_index "attachments", ["thankyou_id", "filename", "id"], :name => "index_attachments_on_thankyou_id_and_filename_and_id"

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "thankyous", :force => true do |t|
    t.integer  "thanker_id"
    t.integer  "welcomer_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "headline"
  end

  add_index "thankyous", ["thanker_id", "welcomer_id"], :name => "index_thankyous_on_thanker_id_and_welcomer_id"
  add_index "thankyous", ["thanker_id"], :name => "index_thankyous_on_thanker_id"
  add_index "thankyous", ["welcomer_id"], :name => "index_thankyous_on_welcomer_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",                                   :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",                                   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "subdomain"
    t.string   "welcome_phrase",                        :default => "These people dig me:"
    t.string   "thankyou_phrase",                       :default => "I give much props to these people:"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
