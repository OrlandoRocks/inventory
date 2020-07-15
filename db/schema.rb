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

ActiveRecord::Schema.define(version: 20180528203035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "branches", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "city_id"
    t.integer  "company_id"
    t.integer  "manager_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "state_id"
    t.string   "code"
  end

  add_index "branches", ["city_id"], name: "index_branches_on_city_id", using: :btree
  add_index "branches", ["company_id"], name: "index_branches_on_company_id", using: :btree
  add_index "branches", ["state_id"], name: "index_branches_on_state_id", using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "company_id"
  end

  add_index "categories", ["company_id"], name: "index_categories_on_company_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo"
    t.string   "manager"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "branch_id"
    t.integer  "manager_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "code"
    t.integer  "sequence"
    t.string   "last_code"
  end

  add_index "departments", ["branch_id"], name: "index_departments_on_branch_id", using: :btree

  create_table "item_files", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "file"
    t.integer  "file_type"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "item_files", ["item_id"], name: "index_item_files_on_item_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "model"
    t.string   "serial_number"
    t.date     "purchased_date"
    t.date     "in_service_date"
    t.integer  "time_unit_service"
    t.decimal  "time_quantity_service"
    t.decimal  "price"
    t.integer  "time_unit_depreciation"
    t.decimal  "time_quantity_depreciation"
    t.integer  "sub_category_id"
    t.integer  "provider_id"
    t.integer  "department_id"
    t.integer  "user_id"
    t.integer  "brand_id"
    t.integer  "status_item_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "code"
    t.string   "image"
    t.date     "maintenance_date"
    t.boolean  "maintenance_done"
    t.integer  "branch_id"
    t.integer  "category_id"
    t.boolean  "to_assing"
  end

  add_index "items", ["branch_id"], name: "index_items_on_branch_id", using: :btree
  add_index "items", ["brand_id"], name: "index_items_on_brand_id", using: :btree
  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["department_id"], name: "index_items_on_department_id", using: :btree
  add_index "items", ["provider_id"], name: "index_items_on_provider_id", using: :btree
  add_index "items", ["status_item_id"], name: "index_items_on_status_item_id", using: :btree
  add_index "items", ["sub_category_id"], name: "index_items_on_sub_category_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "items_maintenances", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "file"
    t.integer  "maintenance_id"
    t.text     "description"
    t.decimal  "price"
    t.string   "provider"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "items_maintenances", ["item_id"], name: "index_items_maintenances_on_item_id", using: :btree
  add_index "items_maintenances", ["maintenance_id"], name: "index_items_maintenances_on_maintenance_id", using: :btree

  create_table "maintenances", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "department_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "offices", ["department_id"], name: "index_offices_on_department_id", using: :btree
  add_index "offices", ["user_id"], name: "index_offices_on_user_id", using: :btree

  create_table "permission_roles", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "permission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "permission_roles", ["permission_id"], name: "index_permission_roles_on_permission_id", using: :btree
  add_index "permission_roles", ["role_id"], name: "index_permission_roles_on_role_id", using: :btree

  create_table "permissions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "action"
    t.string   "controller"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "contact"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "key"
    t.text     "description"
    t.integer  "scope"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree

  create_table "status_items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "key"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "maiden_name"
    t.string   "username"
    t.string   "avatar"
    t.integer  "department_id"
    t.integer  "employee_number"
    t.string   "received_file"
    t.integer  "current_company"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["department_id"], name: "index_users_on_department_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  create_table "users_work_articles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "work_article_id"
    t.integer  "reception_status"
    t.integer  "delivery_status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "users_work_articles", ["user_id"], name: "index_users_work_articles_on_user_id", using: :btree
  add_index "users_work_articles", ["work_article_id"], name: "index_users_work_articles_on_work_article_id", using: :btree

  create_table "work_articles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "branches", "cities"
  add_foreign_key "branches", "companies"
  add_foreign_key "branches", "states"
  add_foreign_key "categories", "companies"
  add_foreign_key "cities", "states"
  add_foreign_key "companies", "users"
  add_foreign_key "departments", "branches"
  add_foreign_key "item_files", "items"
  add_foreign_key "items", "branches"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "departments"
  add_foreign_key "items", "providers"
  add_foreign_key "items", "status_items"
  add_foreign_key "items", "sub_categories"
  add_foreign_key "items", "users"
  add_foreign_key "items_maintenances", "items"
  add_foreign_key "items_maintenances", "maintenances"
  add_foreign_key "offices", "departments"
  add_foreign_key "offices", "users"
  add_foreign_key "permission_roles", "permissions"
  add_foreign_key "permission_roles", "roles"
  add_foreign_key "states", "countries"
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "roles"
  add_foreign_key "users_work_articles", "users"
  add_foreign_key "users_work_articles", "work_articles"
end
