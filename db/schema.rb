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

ActiveRecord::Schema.define(version: 20170911131356) do

  create_table "akts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "contract_id"
    t.date "from_date"
    t.decimal "sum", precision: 17, scale: 2
    t.string "scan_path"
    t.string "text_path"
    t.boolean "is_signed"
    t.boolean "is_deleted"
    t.boolean "is_taken_as_original"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_akts_on_contract_id"
  end

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
    t.text "scanfiles"
    t.text "textfiles"
    t.datetime "deleted_at"
    t.index ["payer_id"], name: "index_contracts_on_payer_id"
    t.index ["recipient_id"], name: "index_contracts_on_recipient_id"
    t.index ["type_id"], name: "index_contracts_on_type_id"
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "reminder_id"
    t.bigint "user_id"
    t.boolean "is_sent"
    t.boolean "to_send"
    t.string "email_address"
    t.text "email_text"
    t.date "on_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["reminder_id"], name: "index_events_on_reminder_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "reminder_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reminders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "reminder_type_id"
    t.decimal "dd", precision: 2
    t.decimal "mm", precision: 2
    t.decimal "yyyy", precision: 4
    t.decimal "dofw", precision: 2
    t.decimal "moq", precision: 1
    t.date "begins"
    t.date "ends"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reminderable_type"
    t.bigint "reminderable_id"
    t.string "message"
    t.datetime "deleted_at"
    t.index ["reminder_type_id"], name: "index_reminders_on_reminder_type_id"
    t.index ["reminderable_type", "reminderable_id"], name: "index_reminders_on_reminderable_type_and_reminderable_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "typical_contract_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "akts", "contracts"
  add_foreign_key "contracts", "companies", column: "payer_id"
  add_foreign_key "contracts", "companies", column: "recipient_id"
  add_foreign_key "contracts", "types"
  add_foreign_key "events", "reminders"
  add_foreign_key "reminders", "reminder_types"
end
