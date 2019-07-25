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

ActiveRecord::Schema.define(version: 20190725005053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
  end

  create_table "student_courses", force: :cascade do |t|
    t.bigint "students_id"
    t.bigint "courses_id"
    t.index ["courses_id"], name: "index_student_courses_on_courses_id"
    t.index ["students_id"], name: "index_student_courses_on_students_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "student_courses", "courses", column: "courses_id"
  add_foreign_key "student_courses", "students", column: "students_id"
end
