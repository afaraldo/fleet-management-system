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

ActiveRecord::Schema[7.0].define(version: 2023_11_24_050001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "blazer_audits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "color"
    t.string "plate_number"
    t.string "chassis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rasp"
    t.boolean "horometro", default: false, null: false
    t.integer "year"
    t.string "assigned_dependency"
    t.string "type_car", null: false
    t.datetime "discarded_at"
    t.bigint "organization_id"
    t.index ["discarded_at"], name: "index_cars_on_discarded_at"
    t.index ["organization_id"], name: "index_cars_on_organization_id"
    t.index ["plate_number", "organization_id"], name: "index_cars_on_plate_number_and_organization_id", unique: true
    t.index ["plate_number"], name: "index_cars_on_plate_number"
    t.index ["rasp"], name: "index_cars_on_rasp"
  end

  create_table "cars_insurance_plans", force: :cascade do |t|
    t.bigint "car_id"
    t.bigint "insurance_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_cars_insurance_plans_on_car_id"
    t.index ["insurance_plan_id"], name: "index_cars_insurance_plans_on_insurance_plan_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "document"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "position"
    t.datetime "discarded_at"
    t.bigint "organization_id"
    t.index ["discarded_at"], name: "index_employees_on_discarded_at"
    t.index ["document", "organization_id"], name: "index_employees_on_document_and_organization_id", unique: true
    t.index ["document"], name: "index_employees_on_document"
    t.index ["organization_id"], name: "index_employees_on_organization_id"
  end

  create_table "good_job_batches", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.jsonb "serialized_properties"
    t.text "on_finish"
    t.text "on_success"
    t.text "on_discard"
    t.text "callback_queue_name"
    t.integer "callback_priority"
    t.datetime "enqueued_at"
    t.datetime "discarded_at"
    t.datetime "finished_at"
  end

  create_table "good_job_executions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "active_job_id", null: false
    t.text "job_class"
    t.text "queue_name"
    t.jsonb "serialized_params"
    t.datetime "scheduled_at"
    t.datetime "finished_at"
    t.text "error"
    t.index ["active_job_id", "created_at"], name: "index_good_job_executions_on_active_job_id_and_created_at"
  end

  create_table "good_job_processes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "state"
  end

  create_table "good_job_settings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "key"
    t.jsonb "value"
    t.index ["key"], name: "index_good_job_settings_on_key", unique: true
  end

  create_table "good_jobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "queue_name"
    t.integer "priority"
    t.jsonb "serialized_params"
    t.datetime "scheduled_at"
    t.datetime "performed_at"
    t.datetime "finished_at"
    t.text "error"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "active_job_id"
    t.text "concurrency_key"
    t.text "cron_key"
    t.uuid "retried_good_job_id"
    t.datetime "cron_at"
    t.uuid "batch_id"
    t.uuid "batch_callback_id"
    t.boolean "is_discrete"
    t.integer "executions_count"
    t.text "job_class"
    t.index ["active_job_id", "created_at"], name: "index_good_jobs_on_active_job_id_and_created_at"
    t.index ["active_job_id"], name: "index_good_jobs_on_active_job_id"
    t.index ["batch_callback_id"], name: "index_good_jobs_on_batch_callback_id", where: "(batch_callback_id IS NOT NULL)"
    t.index ["batch_id"], name: "index_good_jobs_on_batch_id", where: "(batch_id IS NOT NULL)"
    t.index ["concurrency_key"], name: "index_good_jobs_on_concurrency_key_when_unfinished", where: "(finished_at IS NULL)"
    t.index ["cron_key", "created_at"], name: "index_good_jobs_on_cron_key_and_created_at"
    t.index ["cron_key", "cron_at"], name: "index_good_jobs_on_cron_key_and_cron_at", unique: true
    t.index ["finished_at"], name: "index_good_jobs_jobs_on_finished_at", where: "((retried_good_job_id IS NULL) AND (finished_at IS NOT NULL))"
    t.index ["priority", "created_at"], name: "index_good_jobs_jobs_on_priority_created_at_when_unfinished", order: { priority: "DESC NULLS LAST" }, where: "(finished_at IS NULL)"
    t.index ["queue_name", "scheduled_at"], name: "index_good_jobs_on_queue_name_and_scheduled_at", where: "(finished_at IS NULL)"
    t.index ["scheduled_at"], name: "index_good_jobs_on_scheduled_at", where: "(finished_at IS NULL)"
  end

  create_table "insurance_plans", force: :cascade do |t|
    t.date "contract_date", null: false
    t.integer "amount", null: false
    t.date "expiry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "insurance_carrier_id"
    t.string "type_coverage"
    t.datetime "discarded_at"
    t.bigint "organization_id"
    t.index ["discarded_at"], name: "index_insurance_plans_on_discarded_at"
    t.index ["expiry_date"], name: "index_insurance_plans_on_expiry_date"
    t.index ["insurance_carrier_id"], name: "index_insurance_plans_on_insurance_carrier_id"
    t.index ["organization_id"], name: "index_insurance_plans_on_organization_id"
  end

  create_table "maintenances", force: :cascade do |t|
    t.date "date", null: false
    t.bigint "mechanical_workshop_id", null: false
    t.bigint "car_id", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_mileage"
    t.integer "next_mileage"
    t.datetime "discarded_at"
    t.bigint "organization_id"
    t.index ["car_id"], name: "index_maintenances_on_car_id"
    t.index ["discarded_at"], name: "index_maintenances_on_discarded_at"
    t.index ["mechanical_workshop_id"], name: "index_maintenances_on_mechanical_workshop_id"
    t.index ["organization_id"], name: "index_maintenances_on_organization_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_notifications_on_organization_id"
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repairs", force: :cascade do |t|
    t.date "date", null: false
    t.bigint "car_id", null: false
    t.bigint "mechanical_workshop_id", null: false
    t.string "repairs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.bigint "organization_id"
    t.index ["car_id"], name: "index_repairs_on_car_id"
    t.index ["discarded_at"], name: "index_repairs_on_discarded_at"
    t.index ["mechanical_workshop_id"], name: "index_repairs_on_mechanical_workshop_id"
    t.index ["organization_id"], name: "index_repairs_on_organization_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name", null: false
    t.string "ruc", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.bigint "organization_id"
    t.index ["discarded_at"], name: "index_suppliers_on_discarded_at"
    t.index ["organization_id"], name: "index_suppliers_on_organization_id"
  end

  create_table "system_settings_settings", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.text "value"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["name"], name: "index_system_settings_settings_on_name"
    t.index ["type"], name: "index_system_settings_settings_on_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "profile_foto"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.datetime "discarded_at"
    t.boolean "receive_notifications", default: false, null: false
    t.bigint "organization_id"
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.json "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "work_orders", force: :cascade do |t|
    t.bigint "number", null: false
    t.string "description", null: false
    t.string "city"
    t.integer "start_mileage"
    t.integer "final_mileage"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "car_id"
    t.string "integer"
    t.datetime "start_date", null: false
    t.datetime "final_date", null: false
    t.integer "final_oil"
    t.string "area", null: false
    t.integer "status", null: false
    t.datetime "discarded_at"
    t.integer "cost", default: 0, null: false
    t.bigint "organization_id"
    t.index ["car_id"], name: "index_work_orders_on_car_id"
    t.index ["city"], name: "index_work_orders_on_city"
    t.index ["description"], name: "index_work_orders_on_description"
    t.index ["discarded_at"], name: "index_work_orders_on_discarded_at"
    t.index ["employee_id"], name: "index_work_orders_on_employee_id"
    t.index ["final_date"], name: "index_work_orders_on_final_date"
    t.index ["number"], name: "index_work_orders_on_number"
    t.index ["organization_id"], name: "index_work_orders_on_organization_id"
    t.index ["start_date"], name: "index_work_orders_on_start_date"
    t.index ["status"], name: "index_work_orders_on_status"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cars_insurance_plans", "cars"
  add_foreign_key "cars_insurance_plans", "insurance_plans"
  add_foreign_key "insurance_plans", "suppliers", column: "insurance_carrier_id"
  add_foreign_key "maintenances", "cars"
  add_foreign_key "maintenances", "suppliers", column: "mechanical_workshop_id"
  add_foreign_key "repairs", "cars"
  add_foreign_key "work_orders", "cars"
  add_foreign_key "work_orders", "employees"
end
