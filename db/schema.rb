# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "courses", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "code", unsigned: true
    t.string "name"
    t.integer "organization_id", unsigned: true
    t.integer "user_id", unsigned: true
    t.integer "student_number", unsigned: true
    t.index ["organization_id"], name: "fk_courses_organization"
    t.index ["user_id"], name: "fk_courses_user"
  end

  create_table "labs", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "student_number", unsigned: true
  end

  create_table "labs_organizations", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "lab_id", unsigned: true
    t.integer "organization_id", unsigned: true
    t.text "note"
    t.index ["lab_id"], name: "fk_labs_organizations_lab"
    t.index ["organization_id"], name: "fk_labs_organizations_organization"
  end

  create_table "organizations", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "permissions", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "organization_id", unsigned: true
    t.integer "user_id", unsigned: true
    t.integer "authlevel"
    t.index ["organization_id"], name: "fk_permissions_organization"
    t.index ["user_id"], name: "fk_permissions_user"
  end

  create_table "schedules", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "course_id", null: false, unsigned: true
    t.integer "lab_id", null: false, unsigned: true
    t.text "description"
    t.text "ice_tea_sched_serialization"
    t.index ["course_id"], name: "fk_entry_course"
    t.index ["lab_id"], name: "fk_entry_lab"
  end

  create_table "users", id: :integer, unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "upn", null: false
    t.string "name"
    t.string "surname"
    t.string "email"
    t.datetime "updated_at"
    t.index ["upn"], name: "index_upn_on_users"
  end

  add_foreign_key "courses", "organizations", name: "fk_courses_organization"
  add_foreign_key "courses", "users", name: "fk_courses_user"
  add_foreign_key "labs_organizations", "labs", name: "fk_labs_organizations_lab"
  add_foreign_key "labs_organizations", "organizations", name: "fk_labs_organizations_organization"
  add_foreign_key "permissions", "organizations", name: "fk_permissions_organization"
  add_foreign_key "permissions", "users", name: "fk_permissions_user"
  add_foreign_key "schedules", "courses", name: "fk_entry_course", on_update: :cascade
  add_foreign_key "schedules", "labs", name: "fk_entry_lab", on_update: :cascade
end
