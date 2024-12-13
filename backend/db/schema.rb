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

ActiveRecord::Schema[7.0].define(version: 2024_11_15_071459) do
  create_table "award_books", force: :cascade do |t|
    t.integer "times"
    t.string "title"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "literary_award_id", null: false
    t.integer "kasaku", default: 0
    t.index ["literary_award_id"], name: "index_award_books_on_literary_award_id"
  end

  create_table "literary_awards", force: :cascade do |t|
    t.string "name"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "read"
    t.integer "have", default: 0
    t.string "isbn"
    t.string "image"
    t.index ["title", "author"], name: "index_my_books_on_title_and_author"
    t.index ["user_id", "created_at"], name: "index_my_books_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_my_books_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "award_books", "literary_awards"
  add_foreign_key "my_books", "users"
end
