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

ActiveRecord::Schema.define(:version => 20110216195822) do

  create_table "sessions", :force => true do |t|
    t.string    "session_id", :null => false
    t.text      "data"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tweets", :force => true do |t|
    t.string    "content"
    t.timestamp "created"
  end

  create_table "users", :force => true do |t|
    t.string    "username"
    t.string    "password"
    t.string    "name"
    t.string    "twitter_token"
    t.string    "twitter_secret"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "linkedin_token"
    t.string    "linkedin_secret"
    t.string    "facebook_access"
    t.boolean   "facebook_authenticated"
    t.boolean   "twitter_authenticated"
    t.boolean   "linkedin_authenticated"
    t.string    "email"
  end

end
