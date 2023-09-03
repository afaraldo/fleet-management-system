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

ActiveRecord::Schema[7.0].define(version: 2023_08_26_181701) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string   "name",        :null=>false
    t.string   "record_type", :null=>false, :index=>{:name=>"index_active_storage_attachments_uniqueness", :with=>["record_id", "name", "blob_id"], :unique=>true}
    t.bigint   "record_id",   :null=>false
    t.bigint   "blob_id",     :null=>false, :index=>{:name=>"index_active_storage_attachments_on_blob_id"}
    t.datetime "created_at",  :null=>false
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string   "key",          :null=>false, :index=>{:name=>"index_active_storage_blobs_on_key", :unique=>true}
    t.string   "filename",     :null=>false
    t.string   "content_type"
    t.text     "metadata"
    t.string   "service_name", :null=>false
    t.bigint   "byte_size",    :null=>false
    t.string   "checksum"
    t.datetime "created_at",   :null=>false
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id",          :null=>false, :index=>{:name=>"index_active_storage_variant_records_uniqueness", :with=>["variation_digest"], :unique=>true}
    t.string "variation_digest", :null=>false
  end

  create_table "blazer_audits", force: :cascade do |t|
    t.bigint   "user_id",     :index=>{:name=>"index_blazer_audits_on_user_id"}
    t.bigint   "query_id",    :index=>{:name=>"index_blazer_audits_on_query_id"}
    t.text     "statement"
    t.string   "data_source"
    t.datetime "created_at"
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.bigint   "creator_id",     :index=>{:name=>"index_blazer_checks_on_creator_id"}
    t.bigint   "query_id",       :index=>{:name=>"index_blazer_checks_on_query_id"}
    t.string   "state"
    t.string   "schedule"
    t.text     "emails"
    t.text     "slack_channels"
    t.string   "check_type"
    t.text     "message"
    t.datetime "last_run_at"
    t.datetime "created_at",     :null=>false
    t.datetime "updated_at",     :null=>false
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.bigint   "dashboard_id", :index=>{:name=>"index_blazer_dashboard_queries_on_dashboard_id"}
    t.bigint   "query_id",     :index=>{:name=>"index_blazer_dashboard_queries_on_query_id"}
    t.integer  "position"
    t.datetime "created_at",   :null=>false
    t.datetime "updated_at",   :null=>false
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.bigint   "creator_id", :index=>{:name=>"index_blazer_dashboards_on_creator_id"}
    t.string   "name"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.bigint   "creator_id",  :index=>{:name=>"index_blazer_queries_on_creator_id"}
    t.string   "name"
    t.text     "description"
    t.text     "statement"
    t.string   "data_source"
    t.string   "status"
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
  end

  create_table "cars", force: :cascade do |t|
    t.string   "make"
    t.string   "model"
    t.string   "color"
    t.string   "plate_number",        :index=>{:name=>"index_cars_on_plate_number", :unique=>true}
    t.string   "chassis"
    t.datetime "created_at",          :null=>false
    t.datetime "updated_at",          :null=>false
    t.string   "rasp",                :index=>{:name=>"index_cars_on_rasp"}
    t.boolean  "horometro",           :default=>false, :null=>false
    t.integer  "year"
    t.string   "assigned_dependency"
    t.string   "type_car",            :null=>false
    t.datetime "discarded_at",        :index=>{:name=>"index_cars_on_discarded_at"}
  end

  create_table "cars_insurance_plans", force: :cascade do |t|
    t.bigint   "car_id",            :index=>{:name=>"index_cars_insurance_plans_on_car_id"}
    t.bigint   "insurance_plan_id", :index=>{:name=>"index_cars_insurance_plans_on_insurance_plan_id"}
    t.datetime "created_at",        :null=>false
    t.datetime "updated_at",        :null=>false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "document",     :index=>{:name=>"index_employees_on_document", :unique=>true}
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at",   :null=>false
    t.datetime "updated_at",   :null=>false
    t.string   "position"
    t.datetime "discarded_at", :index=>{:name=>"index_employees_on_discarded_at"}
  end

  create_table "good_job_batches", id: :uuid, default: %q{gen_random_uuid()}, force: :cascade do |t|
    t.datetime "created_at",            :null=>false
    t.datetime "updated_at",            :null=>false
    t.text     "description"
    t.jsonb    "serialized_properties"
    t.text     "on_finish"
    t.text     "on_success"
    t.text     "on_discard"
    t.text     "callback_queue_name"
    t.integer  "callback_priority"
    t.datetime "enqueued_at"
    t.datetime "discarded_at"
    t.datetime "finished_at"
  end

  create_table "good_job_executions", id: :uuid, default: %q{gen_random_uuid()}, force: :cascade do |t|
    t.datetime "created_at",        :null=>false
    t.datetime "updated_at",        :null=>false
    t.uuid     "active_job_id",     :null=>false, :index=>{:name=>"index_good_job_executions_on_active_job_id_and_created_at", :with=>["created_at"]}
    t.text     "job_class"
    t.text     "queue_name"
    t.jsonb    "serialized_params"
    t.datetime "scheduled_at"
    t.datetime "finished_at"
    t.text     "error"
  end

  create_table "good_job_processes", id: :uuid, default: %q{gen_random_uuid()}, force: :cascade do |t|
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
    t.jsonb    "state"
  end

  create_table "good_job_settings", id: :uuid, default: %q{gen_random_uuid()}, force: :cascade do |t|
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
    t.text     "key",        :index=>{:name=>"index_good_job_settings_on_key", :unique=>true}
    t.jsonb    "value"
  end

  create_table "good_jobs", id: :uuid, default: %q{gen_random_uuid()}, force: :cascade do |t|
    t.text     "queue_name",          :index=>{:name=>"index_good_jobs_on_queue_name_and_scheduled_at", :with=>["scheduled_at"], :where=>"(finished_at IS NULL)"}
    t.integer  "priority",            :index=>{:name=>"index_good_jobs_jobs_on_priority_created_at_when_unfinished", :with=>["created_at"], :order=>{:priority=>"DESC NULLS LAST", :created_at=>:asc}, :where=>"(finished_at IS NULL)"}
    t.jsonb    "serialized_params"
    t.datetime "scheduled_at",        :index=>{:name=>"index_good_jobs_on_scheduled_at", :where=>"(finished_at IS NULL)"}
    t.datetime "performed_at"
    t.datetime "finished_at",         :index=>{:name=>"index_good_jobs_jobs_on_finished_at", :where=>"((retried_good_job_id IS NULL) AND (finished_at IS NOT NULL))"}
    t.text     "error"
    t.datetime "created_at",          :null=>false
    t.datetime "updated_at",          :null=>false
    t.uuid     "active_job_id",       :index=>{:name=>"index_good_jobs_on_active_job_id"}
    t.text     "concurrency_key",     :index=>{:name=>"index_good_jobs_on_concurrency_key_when_unfinished", :where=>"(finished_at IS NULL)"}
    t.text     "cron_key",            :index=>{:name=>"index_good_jobs_on_cron_key_and_created_at", :with=>["created_at"]}
    t.uuid     "retried_good_job_id"
    t.datetime "cron_at"
    t.uuid     "batch_id",            :index=>{:name=>"index_good_jobs_on_batch_id", :where=>"(batch_id IS NOT NULL)"}
    t.uuid     "batch_callback_id",   :index=>{:name=>"index_good_jobs_on_batch_callback_id", :where=>"(batch_callback_id IS NOT NULL)"}
    t.boolean  "is_discrete"
    t.integer  "executions_count"
    t.text     "job_class"

    t.index ["active_job_id", "created_at"], :name=>"index_good_jobs_on_active_job_id_and_created_at"
    t.index ["cron_key", "cron_at"], :name=>"index_good_jobs_on_cron_key_and_cron_at", :unique=>true
  end

  create_table "insurance_plans", force: :cascade do |t|
    t.date     "contract_date",        :null=>false
    t.integer  "amount",               :null=>false
    t.date     "expiry_date",          :index=>{:name=>"index_insurance_plans_on_expiry_date"}
    t.datetime "created_at",           :null=>false
    t.datetime "updated_at",           :null=>false
    t.bigint   "insurance_carrier_id", :index=>{:name=>"index_insurance_plans_on_insurance_carrier_id"}
    t.string   "type_coverage"
    t.datetime "discarded_at",         :index=>{:name=>"index_insurance_plans_on_discarded_at"}
  end

  create_table "maintenances", force: :cascade do |t|
    t.date     "date",                   :null=>false
    t.bigint   "mechanical_workshop_id", :null=>false, :index=>{:name=>"index_maintenances_on_mechanical_workshop_id"}
    t.bigint   "car_id",                 :null=>false, :index=>{:name=>"index_maintenances_on_car_id"}
    t.string   "description"
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
    t.integer  "current_mileage"
    t.integer  "next_mileage"
    t.datetime "discarded_at",           :index=>{:name=>"index_maintenances_on_discarded_at"}
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "recipient_type", :null=>false, :index=>{:name=>"index_notifications_on_recipient", :with=>["recipient_id"]}
    t.bigint   "recipient_id",   :null=>false
    t.string   "type",           :null=>false
    t.jsonb    "params"
    t.datetime "read_at",        :index=>{:name=>"index_notifications_on_read_at"}
    t.datetime "created_at",     :null=>false
    t.datetime "updated_at",     :null=>false
  end

  create_table "repairs", force: :cascade do |t|
    t.date     "date",                   :null=>false
    t.bigint   "car_id",                 :null=>false, :index=>{:name=>"index_repairs_on_car_id"}
    t.bigint   "mechanical_workshop_id", :null=>false, :index=>{:name=>"index_repairs_on_mechanical_workshop_id"}
    t.string   "repairs"
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
    t.datetime "discarded_at",           :index=>{:name=>"index_repairs_on_discarded_at"}
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name",         :null=>false
    t.string   "ruc",          :null=>false
    t.string   "type",         :null=>false
    t.datetime "created_at",   :null=>false
    t.datetime "updated_at",   :null=>false
    t.datetime "discarded_at", :index=>{:name=>"index_suppliers_on_discarded_at"}
  end

  create_table "system_settings_settings", id: :serial, force: :cascade do |t|
    t.string   "name",        :null=>false, :index=>{:name=>"index_system_settings_settings_on_name", :unique=>true}
    t.string   "type",        :null=>false, :index=>{:name=>"index_system_settings_settings_on_type"}
    t.text     "value"
    t.text     "description"
    t.datetime "created_at",  :precision=>nil, :null=>false
    t.datetime "updated_at",  :precision=>nil, :null=>false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  :default=>"", :null=>false, :index=>{:name=>"index_users_on_email", :unique=>true}
    t.string   "encrypted_password",     :default=>"", :null=>false
    t.string   "profile_foto"
    t.string   "reset_password_token",   :index=>{:name=>"index_users_on_reset_password_token", :unique=>true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default=>0, :null=>false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
    t.integer  "role"
    t.datetime "discarded_at",           :index=>{:name=>"index_users_on_discarded_at"}
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      :null=>false, :index=>{:name=>"index_versions_on_item_type_and_item_id", :with=>["item_id"]}
    t.bigint   "item_id",        :null=>false
    t.string   "event",          :null=>false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.json     "object_changes"
  end

  create_table "work_orders", force: :cascade do |t|
    t.bigint   "number",        :null=>false, :index=>{:name=>"index_work_orders_on_number", :unique=>true}
    t.string   "description",   :null=>false, :index=>{:name=>"index_work_orders_on_description"}
    t.string   "city",          :index=>{:name=>"index_work_orders_on_city"}
    t.integer  "start_mileage"
    t.integer  "final_mileage"
    t.bigint   "employee_id",   :index=>{:name=>"index_work_orders_on_employee_id"}
    t.datetime "created_at",    :null=>false
    t.datetime "updated_at",    :null=>false
    t.bigint   "car_id",        :index=>{:name=>"index_work_orders_on_car_id"}
    t.string   "integer"
    t.datetime "start_date",    :null=>false, :index=>{:name=>"index_work_orders_on_start_date"}
    t.datetime "final_date",    :null=>false, :index=>{:name=>"index_work_orders_on_final_date"}
    t.integer  "final_oil"
    t.string   "area",          :null=>false
    t.integer  "status",        :null=>false, :index=>{:name=>"index_work_orders_on_status"}
    t.datetime "discarded_at",  :index=>{:name=>"index_work_orders_on_discarded_at"}
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "insurance_plans", "suppliers", column: "insurance_carrier_id"
  add_foreign_key "maintenances", "cars"
  add_foreign_key "maintenances", "suppliers", column: "mechanical_workshop_id"
  add_foreign_key "repairs", "cars"
  add_foreign_key "work_orders", "cars"
  add_foreign_key "work_orders", "employees"
end
