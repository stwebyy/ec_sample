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

ActiveRecord::Schema.define(version: 2019_07_27_040406) do

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", limit: 50, null: false, comment: "商品名"
    t.integer "stocks", default: 0, null: false, comment: "在庫数"
    t.text "descriotion", null: false, comment: "商品説明"
    t.boolean "hide", null: false, comment: "表示・非表示"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", limit: 40, null: false, comment: "店舗名"
    t.string "address", null: false, comment: "住所"
    t.integer "telephone", null: false, comment: "電話番号"
    t.string "person", null: false, comment: "責任者"
    t.boolean "hide", null: false, comment: "表示・非表示"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end