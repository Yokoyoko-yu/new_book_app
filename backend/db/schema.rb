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

ActiveRecord::Schema[7.0].define(version: 2025_06_23_123452) do
  create_table "award_book_contents", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "isbn", null: false
    t.bigint "award_title_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["award_title_id"], name: "index_award_book_contents_on_award_title_id"
    t.index ["isbn"], name: "fk_rails_7a42bacfcd"
  end

  create_table "award_grants", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "award_id", null: false
    t.bigint "award_title_id", null: false
    t.integer "times", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["award_id"], name: "index_award_grants_on_award_id"
    t.index ["award_title_id"], name: "index_award_grants_on_award_title_id"
  end

  create_table "award_titles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.string "author", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "awards", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "total", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", primary_key: "isbn", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "author", null: false
    t.string "title", null: false
    t.string "publisher", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_books", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "isbn", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["isbn"], name: "fk_rails_29857ce198"
    t.index ["user_id"], name: "index_user_books_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
  end

  add_foreign_key "award_book_contents", "award_titles"
  add_foreign_key "award_book_contents", "books", column: "isbn", primary_key: "isbn"
  add_foreign_key "award_grants", "award_titles"
  add_foreign_key "award_grants", "awards"
  add_foreign_key "user_books", "books", column: "isbn", primary_key: "isbn"
  add_foreign_key "user_books", "users"
end
