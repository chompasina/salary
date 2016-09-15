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

ActiveRecord::Schema.define(version: 20160724031802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.string   "job_title"
    t.string   "company"
    t.string   "city"
    t.string   "state"
    t.integer  "salary"
    t.date     "start_date"
    t.boolean  "current_job"
    t.date     "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_jobs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_user_jobs_on_job_id", using: :btree
    t.index ["user_id"], name: "index_user_jobs_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.date    "birthdate"
    t.string  "username"
    t.string  "password_digest"
    t.string  "email"
    t.boolean "admin",           default: false
    t.string  "first_name"
    t.string  "last_name"
    t.integer "cohort"
  end

  add_foreign_key "user_jobs", "jobs"
  add_foreign_key "user_jobs", "users"
end
