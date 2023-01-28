# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_01_24_005128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string "department"
    t.string "manager"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employee_schedules", force: :cascade do |t|
    t.date "check_in"
    t.string "checkout_date"
    t.time "lunch"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "employee_id", null: false
    t.index ["employee_id"], name: "index_employee_schedules_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "phone"
    t.string "location"
    t.string "address"
    t.string "account_role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "department_id", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
  end

  create_table "wages", force: :cascade do |t|
    t.datetime "hire_date"
    t.integer "salary"
    t.integer "hrs_worked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "employee_id", null: false
    t.index ["employee_id"], name: "index_wages_on_employee_id"
  end

  add_foreign_key "employee_schedules", "employees"
  add_foreign_key "employees", "departments"
  add_foreign_key "wages", "employees"
end
