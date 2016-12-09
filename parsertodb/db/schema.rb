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

ActiveRecord::Schema.define(version: 20161209093349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.text     "Num"
    t.text     "UNNRec"
    t.text     "KorNameOnly"
    t.text     "Nazn"
    t.text     "Cod"
    t.text     "Acc"
    t.text     "Db"
    t.text     "DbS"
    t.text     "Credit"
    t.text     "CreditS"
    t.text     "QueuePay"
    t.text     "VidDoc"
    t.text     "DocDate"
    t.text     "DocType"
    t.text     "DB"
    t.text     "DBS"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "system_data", force: :cascade do |t|
    t.text     "CR"
    t.text     "CRS"
    t.text     "DateOut"
    t.text     "DebOut"
    t.text     "CrOut"
    t.text     "RestOutS"
    t.text     "stampLeft"
    t.text     "stampRight"
    t.text     "stampTop"
    t.text     "stampBottom"
    t.text     "KOD_SOATO"
    t.text     "SEAL_NUMBER"
    t.text     "FILIAL_NAME"
    t.text     "PODR_NAME"
    t.text     "DATE_PROV"
    t.text     "USER"
    t.text     "USER_KOD"
    t.text     "Answer"
    t.text     "AppSign"
    t.text     "BAppSign"
    t.text     "FIOSign"
    t.text     "BFIOSign"
    t.text     "KeySign"
    t.text     "BKeySign"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
