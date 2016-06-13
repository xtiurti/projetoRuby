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

ActiveRecord::Schema.define(version: 20160613025325) do

  create_table "disciplines", force: :cascade do |t|
    t.string   "name"
    t.string   "cod"
    t.integer  "period"
    t.integer  "matrix"
    t.string   "course"
    t.string   "substantiation"
    t.string   "goals"
    t.string   "ement"
    t.integer  "at"
    t.integer  "ap"
    t.integer  "aps"
    t.integer  "ad"
    t.integer  "apcc"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "total"
  end

  create_table "program_contents", force: :cascade do |t|
    t.integer  "item"
    t.text     "ement"
    t.text     "content"
    t.integer  "discipline_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "program_contents", ["discipline_id"], name: "index_program_contents_on_discipline_id"

  create_table "programmings", force: :cascade do |t|
    t.string   "day_month_week"
    t.string   "content_classes"
    t.integer  "number_classes"
    t.integer  "teaching_plan_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "programmings", ["teaching_plan_id"], name: "index_programmings_on_teaching_plan_id"

  create_table "teaching_plans", force: :cascade do |t|
    t.string   "teacher"
    t.string   "team"
    t.string   "semester"
    t.text     "evaluation"
    t.text     "references"
    t.text     "guidelines"
    t.integer  "discipline_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "teaching_plans", ["discipline_id"], name: "index_teaching_plans_on_discipline_id"

  create_table "teaching_procedures", force: :cascade do |t|
    t.text     "theoretical_classes"
    t.text     "practical_classes"
    t.text     "aps"
    t.text     "activies_distance"
    t.text     "apcc"
    t.integer  "teaching_plan_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "teaching_procedures", ["teaching_plan_id"], name: "index_teaching_procedures_on_teaching_plan_id"

end
