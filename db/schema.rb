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

ActiveRecord::Schema.define(:version => 20131205025659) do

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "video_id"
    t.string   "subject"
    t.string   "course"
    t.string   "title"
    t.integer  "translator_id"
    t.integer  "typer_id"
    t.integer  "qa_id"
    t.boolean  "translate_complete"
    t.boolean  "type_complete"
    t.boolean  "qa_complete"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "translation_handwritten"
    t.date     "due_date"
  end

  add_index "videos", ["video_id"], :name => "index_videos_on_video_id", :unique => true

end
