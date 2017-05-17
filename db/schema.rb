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

ActiveRecord::Schema.define(version: 20170517195122) do

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "address"
    t.string "edrpou"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "number"
    t.decimal "sum", precision: 17, scale: 2
    t.date "from_date"
    t.date "to_date"
    t.string "till"
    t.boolean "is_signed"
    t.boolean "is_active"
    t.boolean "is_deleted"
    t.string "acts_schedule"
    t.string "payments_schedule"
    t.string "scan_path"
    t.string "text_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "type_id"
    t.bigint "payer_id"
    t.bigint "recipient_id"
    t.bigint "responsible_user_id"
    t.string "responsible_user_name"
    t.bigint "creator_user_id"
    t.string "creator_user_name"
    t.text "preferences"
    t.index ["payer_id"], name: "index_contracts_on_payer_id"
    t.index ["recipient_id"], name: "index_contracts_on_recipient_id"
    t.index ["type_id"], name: "index_contracts_on_type_id"
  end

  create_table "reminder_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reminders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "type_id"
    t.decimal "dd", precision: 10
    t.decimal "mm", precision: 10
    t.decimal "yyyy", precision: 10
    t.decimal "dofw", precision: 10
    t.decimal "moq", precision: 10
    t.date "begins"
    t.date "ends"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_id"], name: "index_reminders_on_type_id"
  end

  create_table "types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "typical_contract_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contracts", "companies", column: "payer_id"
  add_foreign_key "contracts", "companies", column: "recipient_id"
  add_foreign_key "contracts", "types"
  add_foreign_key "reminders", "types"
end
