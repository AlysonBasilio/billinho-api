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

ActiveRecord::Schema.define(version: 2018_09_22_165033) do

  create_table "institutions", force: :cascade do |t|
    t.string "name", null: false
    t.string "cnpj", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "institution_type", default: 0
    t.index ["cnpj"], name: "index_institutions_on_cnpj", unique: true
    t.index ["name"], name: "index_institutions_on_name", unique: true
  end

  create_table "invoices", force: :cascade do |t|
    t.decimal "value"
    t.date "expiration_date"
    t.string "status"
    t.integer "registration_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registration_id"], name: "index_invoices_on_registration_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.decimal "value"
    t.integer "invoice_qty"
    t.integer "expiration_date"
    t.string "course"
    t.integer "institution_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_registrations_on_institution_id"
    t.index ["student_id"], name: "index_registrations_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.date "birth_date"
    t.integer "phone"
    t.string "gender"
    t.string "payment_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
