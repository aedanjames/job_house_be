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

ActiveRecord::Schema.define(version: 2022_05_04_162632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.string "company"
    t.integer "salary"
    t.string "location"
    t.string "contact"
    t.bigint "api_job_id"
    t.string "title"
  end

  create_table "user_house_jobs", force: :cascade do |t|
    t.bigint "user_house_id"
    t.bigint "job_id"
    t.index ["job_id"], name: "index_user_house_jobs_on_job_id"
    t.index ["user_house_id"], name: "index_user_house_jobs_on_user_house_id"
  end

  create_table "user_houses", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "house_id"
    t.index ["user_id"], name: "index_user_houses_on_user_id"
  end

  create_table "user_job_houses", force: :cascade do |t|
    t.bigint "user_job_id"
    t.integer "house_id"
    t.index ["user_job_id"], name: "index_user_job_houses_on_user_job_id"
  end

  create_table "user_jobs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "job_id"
    t.index ["job_id"], name: "index_user_jobs_on_job_id"
    t.index ["user_id"], name: "index_user_jobs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "user_house_jobs", "jobs"
  add_foreign_key "user_house_jobs", "user_houses"
  add_foreign_key "user_houses", "users"
  add_foreign_key "user_job_houses", "user_jobs"
  add_foreign_key "user_jobs", "jobs"
  add_foreign_key "user_jobs", "users"
end
