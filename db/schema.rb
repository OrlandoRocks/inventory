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

ActiveRecord::Schema.define(version: 2020_09_28_032545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "audits", id: :serial, force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index"
    t.index ["auditable_id", "auditable_type"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "branches", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "city_id"
    t.integer "company_id"
    t.integer "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state_id"
    t.string "code"
    t.integer "last_code"
    t.index ["city_id"], name: "index_branches_on_city_id"
    t.index ["company_id"], name: "index_branches_on_company_id"
    t.index ["state_id"], name: "index_branches_on_state_id"
  end

  create_table "brands", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_categories_on_company_id"
  end

  create_table "cities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "maiden_name"
    t.string "address"
    t.string "postal_code"
    t.string "email"
    t.string "phone_number"
    t.string "cellphone"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "logo"
    t.string "manager"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "countries", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "branch_id"
    t.integer "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.integer "sequence"
    t.string "last_code"
    t.index ["branch_id"], name: "index_departments_on_branch_id"
  end

  create_table "fiscal_vouchers", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_files", id: :serial, force: :cascade do |t|
    t.integer "item_id"
    t.string "file"
    t.integer "file_type"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_files_on_item_id"
  end

  create_table "items", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "model"
    t.string "serial_number"
    t.date "purchased_date"
    t.date "in_service_date"
    t.integer "time_unit_service"
    t.decimal "time_quantity_service"
    t.decimal "price"
    t.integer "time_unit_depreciation"
    t.decimal "time_quantity_depreciation"
    t.integer "sub_category_id"
    t.integer "provider_id"
    t.integer "department_id"
    t.integer "user_id"
    t.integer "brand_id"
    t.integer "status_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.string "image"
    t.date "maintenance_date"
    t.boolean "maintenance_done"
    t.integer "branch_id"
    t.integer "category_id"
    t.boolean "to_assing"
    t.decimal "sale_price"
    t.string "remission"
    t.string "accessory"
    t.date "acquisition_date"
    t.bigint "trailer_id"
    t.integer "payment_type"
    t.bigint "fiscal_voucher_id"
    t.bigint "client_id"
    t.decimal "advance_payment"
    t.index ["branch_id"], name: "index_items_on_branch_id"
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["client_id"], name: "index_items_on_client_id"
    t.index ["department_id"], name: "index_items_on_department_id"
    t.index ["fiscal_voucher_id"], name: "index_items_on_fiscal_voucher_id"
    t.index ["provider_id"], name: "index_items_on_provider_id"
    t.index ["status_item_id"], name: "index_items_on_status_item_id"
    t.index ["sub_category_id"], name: "index_items_on_sub_category_id"
    t.index ["trailer_id"], name: "index_items_on_trailer_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "items_maintenances", id: :serial, force: :cascade do |t|
    t.integer "item_id"
    t.string "file"
    t.integer "maintenance_id"
    t.text "description"
    t.decimal "price"
    t.string "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_items_maintenances_on_item_id"
    t.index ["maintenance_id"], name: "index_items_maintenances_on_maintenance_id"
  end

  create_table "maintenances", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "department_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_offices_on_department_id"
    t.index ["user_id"], name: "index_offices_on_user_id"
  end

  create_table "permission_roles", id: :serial, force: :cascade do |t|
    t.integer "role_id"
    t.integer "permission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_permission_roles_on_permission_id"
    t.index ["role_id"], name: "index_permission_roles_on_role_id"
  end

  create_table "permissions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "action"
    t.string "controller"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "contact"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.text "description"
    t.integer "scope"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "status_items", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "key"
  end

  create_table "sub_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "trailers", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "sub_category_id"
    t.string "image"
    t.index ["category_id"], name: "index_trailers_on_category_id"
    t.index ["sub_category_id"], name: "index_trailers_on_sub_category_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "role_id"
    t.string "first_name"
    t.string "last_name"
    t.string "maiden_name"
    t.string "username"
    t.string "avatar"
    t.integer "department_id"
    t.integer "employee_number"
    t.string "received_file"
    t.integer "current_company"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "users_work_articles", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "work_article_id"
    t.integer "reception_status"
    t.integer "delivery_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_users_work_articles_on_user_id"
    t.index ["work_article_id"], name: "index_users_work_articles_on_work_article_id"
  end

  create_table "work_articles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
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
  add_foreign_key "items", "clients"
  add_foreign_key "items", "departments"
  add_foreign_key "items", "fiscal_vouchers"
  add_foreign_key "items", "providers"
  add_foreign_key "items", "status_items"
  add_foreign_key "items", "sub_categories"
  add_foreign_key "items", "trailers"
  add_foreign_key "items", "users"
  add_foreign_key "items_maintenances", "items"
  add_foreign_key "items_maintenances", "maintenances"
  add_foreign_key "offices", "departments"
  add_foreign_key "offices", "users"
  add_foreign_key "permission_roles", "permissions"
  add_foreign_key "permission_roles", "roles"
  add_foreign_key "states", "countries"
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "trailers", "categories"
  add_foreign_key "trailers", "sub_categories"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "roles"
  add_foreign_key "users_work_articles", "users"
  add_foreign_key "users_work_articles", "work_articles"
end
