class InitSchema < ActiveRecord::Migration[5.2]
  def up
    create_table "admins" do |t|
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
    create_table "cart_items" do |t|
      t.integer "user_id"
      t.integer "product_id"
      t.integer "quantity"
      t.integer "day"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "combo_id"
      t.index ["combo_id"], name: "index_cart_items_on_combo_id"
    end
    create_table "combo_items" do |t|
      t.integer "product_id"
      t.integer "combo_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "quantity"
    end
    create_table "combos" do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "price"
      t.string "combo_image_id"
    end
    create_table "creditcards" do |t|
      t.integer "user_id"
      t.integer "customer_id"
      t.integer "card_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "favorites" do |t|
      t.integer "user_id"
      t.integer "product_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "in_points" do |t|
      t.integer "user_id"
      t.integer "order_id"
      t.integer "point"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "likes" do |t|
      t.integer "user_id"
      t.integer "product_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "messages" do |t|
      t.text "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "order_records" do |t|
      t.integer "product_id"
      t.integer "order_id"
      t.integer "quantity"
      t.integer "end_price"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "combo_id"
      t.integer "user_id"
      t.integer "status"
      t.index ["combo_id"], name: "index_order_records_on_combo_id"
      t.index ["user_id"], name: "index_order_records_on_user_id"
    end
    create_table "orders" do |t|
      t.integer "user_id"
      t.integer "get_status"
      t.integer "return_status"
      t.integer "create_point"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "zip_code"
      t.string "address"
      t.date "start_date"
      t.date "finish_date"
      t.integer "day"
      t.boolean "pay_status", default: false, null: false
      t.boolean "give_point", default: false, null: false
    end
    create_table "out_points" do |t|
      t.integer "user_id"
      t.integer "order_id"
      t.integer "point"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "product_comments" do |t|
      t.integer "user_id"
      t.integer "product_id"
      t.string "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "product_kinds" do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean "status", default: false, null: false
    end
    create_table "products" do |t|
      t.integer "product_kind_id"
      t.string "name"
      t.text "introduction"
      t.integer "price"
      t.string "product_image_id"
      t.integer "stock"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "questions" do |t|
      t.text "question"
      t.text "answer"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "users" do |t|
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
      t.string "provider"
      t.string "uid"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
