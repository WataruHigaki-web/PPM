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

ActiveRecord::Schema.define(version: 2020_03_25_053103) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "name_kana"
    t.string "profile_image_id"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.integer "quantity"
    t.integer "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "combo_id"
    t.index ["combo_id"], name: "index_cart_items_on_combo_id"
  end

  create_table "combo_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "combo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
  end

  create_table "combos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
  end

  create_table "creditcards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "credit_number"
    t.string "credit_name"
    t.integer "security_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "in_points", force: :cascade do |t|
    t.integer "user_id"
    t.integer "order_id"
    t.integer "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_records", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "quantity"
    t.integer "end_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "combo_id"
    t.integer "user_id"
    t.index ["combo_id"], name: "index_order_records_on_combo_id"
    t.index ["user_id"], name: "index_order_records_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "get_status"
    t.integer "return_status"
    t.integer "create_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zip_code"
    t.string "address"
    t.integer "start_date"
    t.integer "finish_date"
    t.integer "day"
    t.integer "status"
  end

  create_table "out_points", force: :cascade do |t|
    t.integer "user_id"
    t.integer "order_id"
    t.integer "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_kinds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: false, null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "product_kind_id"
    t.string "name"
    t.text "introduction"
    t.integer "price"
    t.string "product_image_id"
    t.integer "stock"
    t.boolean "status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "name_kana"
    t.string "profile_image_id"
    t.string "zip_code"
    t.string "address"
    t.string "phone_number"
    t.integer "credit_number"
    t.string "credit_name"
    t.integer "security_code"
    t.boolean "status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
