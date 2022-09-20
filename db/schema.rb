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

ActiveRecord::Schema[7.0].define(version: 2022_09_15_001355) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "color"
    t.string "plate_number"
    t.string "chassis"
    t.string "engine"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "documento"
    t.string "direccion"
    t.string "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "system_settings_settings", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.text "value"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["name"], name: "index_system_settings_settings_on_name", unique: true
    t.index ["type"], name: "index_system_settings_settings_on_type"
  end

  create_table "work_orders", force: :cascade do |t|
    t.date "fecha"
    t.string "solicitado_por"
    t.string "encargado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
