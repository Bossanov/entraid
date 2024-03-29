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

ActiveRecord::Schema.define(version: 2021_09_01_124251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articlecommits", force: :cascade do |t|
    t.text "content", null: false
    t.string "autor"
    t.string "statut", default: "no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "article_id"
    t.index ["article_id"], name: "index_articlecommits_on_article_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.string "photo"
    t.string "statut", default: "no"
    t.string "theme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_id"
    t.index ["profile_id"], name: "index_articles_on_profile_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.text "content"
  end

  create_table "conversationcommits", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "conversation_id"
    t.string "autor"
    t.index ["conversation_id"], name: "index_conversationcommits_on_conversation_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.text "content"
    t.string "autor"
    t.string "dest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_id"
    t.index ["profile_id"], name: "index_conversations_on_profile_id"
  end

  create_table "messagecommits", force: :cascade do |t|
    t.text "content", null: false
    t.string "autor", null: false
    t.string "statut", default: "no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "message_id"
    t.index ["message_id"], name: "index_messagecommits_on_message_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "title", null: false
    t.string "theme", null: false
    t.string "statut", default: "no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.bigint "profile_id"
    t.index ["profile_id"], name: "index_messages_on_profile_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "content"
    t.string "autor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "dest"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "job", null: false
    t.string "city", null: false
    t.string "photo"
    t.date "birthday", null: false
    t.string "phone_number", null: false
    t.string "statut", default: "no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pseudo", null: false
    t.bigint "user_id"
    t.text "biography"
    t.string "admin", default: "no", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articlecommits", "articles"
  add_foreign_key "articles", "profiles"
  add_foreign_key "conversationcommits", "conversations"
  add_foreign_key "conversations", "profiles"
  add_foreign_key "messagecommits", "messages"
  add_foreign_key "messages", "profiles"
  add_foreign_key "profiles", "users"
end
