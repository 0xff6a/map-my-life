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

ActiveRecord::Schema.define(version: 20141022152946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "run_targets", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "runs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "targets", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "pace"
    t.string   "pace_metric"
    t.decimal  "distance"
    t.string   "distance_metric"
    t.date     "due_date"
    t.integer  "workout_id"
    t.string   "type"
  end

  add_index "targets", ["workout_id"], name: "index_targets_on_workout_id", using: :btree

  create_table "targets_workouts", id: false, force: true do |t|
    t.integer "workout_id", null: false
    t.integer "target_id",  null: false
  end

  create_table "training_paces", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.decimal  "multiplier_vo2"
  end

  create_table "workouts", force: true do |t|
    t.text     "activity"
    t.decimal  "duration"
    t.string   "intensity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "pace"
    t.string   "pace_metric"
    t.date     "date"
    t.decimal  "distance"
    t.string   "distance_metric"
    t.integer  "mmf_id"
    t.string   "type"
  end

end
