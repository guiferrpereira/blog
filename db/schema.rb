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

ActiveRecord::Schema.define(version: 20141216230336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "postgres_bases", force: true do |t|
    t.hstore "key"
    t.binary "value"
  end

  add_index "postgres_bases", ["key"], name: "index_postgres_bases_on_key", using: :gin

  create_table "users", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.integer "age"
    t.string  "email"
  end

end
