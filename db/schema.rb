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

ActiveRecord::Schema[7.0].define(version: 2022_10_31_041923) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string   "make"
    t.string   "model"
    t.string   "color"
    t.string   "plate_number"
    t.string   "chassis"
    t.string   "engine"
    t.datetime "created_at",   :null=>false
    t.datetime "updated_at",   :null=>false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "document"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "maintenances", force: :cascade do |t|
    t.date     "date",                   :null=>false
    t.bigint   "mechanical_workshop_id", :null=>false, :index=>{:name=>"index_maintenances_on_mechanical_workshop_id"}
    t.integer  "budget"
    t.bigint   "car_id",                 :null=>false, :index=>{:name=>"index_maintenances_on_car_id"}
    t.string   "description"
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name",       :null=>false
    t.string   "ruc",        :null=>false
    t.string   "type",       :null=>false
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
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
    t.bigint   "number",        :null=>false, :index=>{:name=>"index_work_orders_on_number"}
    t.string   "description",   :null=>false, :index=>{:name=>"index_work_orders_on_description"}
    t.string   "city",          :index=>{:name=>"index_work_orders_on_city"}
    t.integer  "workdays"
    t.integer  "start_mileage"
    t.integer  "final_mileage"
    t.bigint   "employee_id",   :index=>{:name=>"index_work_orders_on_employee_id"}
    t.datetime "created_at",    :null=>false
    t.datetime "updated_at",    :null=>false
    t.bigint   "car_id",        :index=>{:name=>"index_work_orders_on_car_id"}
    t.integer  "status"
    t.datetime "start_date",    :precision=>nil, :null=>false
    t.datetime "final_date",    :precision=>nil, :null=>false
    t.integer  "final_oil"
  end

  add_foreign_key "maintenances", "cars"
  add_foreign_key "maintenances", "suppliers", column: "mechanical_workshop_id"
  add_foreign_key "work_orders", "cars"
  add_foreign_key "work_orders", "employees"
end
