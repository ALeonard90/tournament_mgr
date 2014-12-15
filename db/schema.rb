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

ActiveRecord::Schema.define(version: 20141215173218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: true do |t|
    t.string  "type",    null: false
    t.integer "number",  null: false
    t.integer "winner"
    t.integer "loser"
    t.integer "pool_id"
  end

  create_table "players", force: true do |t|
    t.string  "name",          null: false
    t.integer "weight",        null: false
    t.integer "age",           null: false
    t.string  "gender",        null: false
    t.string  "rank",          null: false
    t.integer "tournament_id"
    t.integer "pool_id"
  end

  create_table "players_matches", force: true do |t|
    t.integer "player_id"
    t.integer "match_id"
  end

  create_table "pools", force: true do |t|
    t.string  "name",          null: false
    t.string  "gender"
    t.string  "rank"
    t.integer "min_age"
    t.integer "max_age"
    t.integer "min_weight"
    t.integer "max_weight"
    t.integer "tournament_id"
  end

  create_table "tournaments", force: true do |t|
    t.string  "name",    null: false
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string "user_name",       null: false
    t.string "email",           null: false
    t.string "password_digest", null: false
  end

end
