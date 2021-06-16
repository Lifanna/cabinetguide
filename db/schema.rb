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

ActiveRecord::Schema.define(version: 20210616141258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "region_id"
    t.boolean "isDeleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.boolean "isDeleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "education_forms", force: :cascade do |t|
    t.string "name"
    t.boolean "isDeleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "education_programs", force: :cascade do |t|
    t.string "name"
    t.integer "education_form_id"
    t.boolean "isDeleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institution_types", force: :cascade do |t|
    t.string "name"
    t.boolean "isDeleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.integer "institution_type_id"
    t.integer "city_id"
    t.boolean "isDeleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.boolean "isDeleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string "name"
    t.integer "department_id"
    t.boolean "isDeleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.boolean "isDeleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "institution_id", default: 1
    t.integer "education_program_id", default: 1
    t.integer "department_id", default: 30
    t.integer "education_form_id", default: 7
    t.integer "language_id", default: 2
    t.integer "subject_id", default: 1
    t.text "question"
    t.boolean "isDeleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.integer "institution_type_id"
    t.boolean "isDeleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "switches", force: :cascade do |t|
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cities", "regions"
  add_foreign_key "education_programs", "education_forms"
  add_foreign_key "institutions", "cities"
  add_foreign_key "institutions", "institution_types"
  add_foreign_key "managers", "departments"
  add_foreign_key "requests", "departments"
  add_foreign_key "requests", "education_forms"
  add_foreign_key "requests", "education_programs"
  add_foreign_key "requests", "institutions"
  add_foreign_key "requests", "languages"
  add_foreign_key "requests", "subjects"
  add_foreign_key "requests", "users"
  add_foreign_key "subjects", "institution_types"
end
