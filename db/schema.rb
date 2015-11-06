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

ActiveRecord::Schema.define(version: 20151105170923) do

  create_table "bars", force: :cascade do |t|
    t.integer  "eventId"
    t.date     "eventDate"
    t.string   "eventTitle"
    t.string   "eventPrice"
    t.string   "eventGoogleMapsUrl"
    t.text     "eventBlob"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.date     "eventDate"
    t.integer  "eventId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sports", force: :cascade do |t|
    t.text     "eventBlob"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
