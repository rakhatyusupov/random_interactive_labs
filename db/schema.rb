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

ActiveRecord::Schema[8.1].define(version: 2026_02_02_153215) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.integer "approved_by_id"
    t.datetime "created_at", null: false
    t.datetime "published_at"
    t.string "slug"
    t.integer "status", default: 0
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["slug"], name: "index_articles_on_slug", unique: true
    t.index ["status"], name: "index_articles_on_status"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "cases", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "collection_items", force: :cascade do |t|
    t.integer "collection_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.string "item_type"
    t.integer "position"
    t.string "title"
    t.datetime "updated_at", null: false
    t.string "url"
    t.index ["collection_id"], name: "index_collection_items_on_collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "slug"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "followable_id", null: false
    t.string "followable_type", null: false
    t.integer "follower_id", null: false
    t.datetime "updated_at", null: false
    t.index ["followable_type", "followable_id"], name: "index_follows_on_followable_type_and_followable_id"
    t.index ["follower_id", "followable_type", "followable_id"], name: "unique_follows", unique: true
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "gutentag_taggings", force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "tag_id", null: false
    t.integer "taggable_id", null: false
    t.string "taggable_type", null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["tag_id"], name: "index_gutentag_taggings_on_tag_id"
    t.index ["taggable_type", "taggable_id", "tag_id"], name: "unique_taggings", unique: true
    t.index ["taggable_type", "taggable_id"], name: "index_gutentag_taggings_on_taggable_type_and_taggable_id"
  end

  create_table "gutentag_tags", force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.string "name", null: false
    t.integer "taggings_count", default: 0, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["name"], name: "index_gutentag_tags_on_name", unique: true
    t.index ["taggings_count"], name: "index_gutentag_tags_on_taggings_count"
  end

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin", default: false, null: false
    t.text "bio"
    t.string "company"
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "github"
    t.string "instagram"
    t.string "linkedin"
    t.string "position"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "twitter"
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "website"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles", "users"
  add_foreign_key "articles", "users", column: "approved_by_id"
  add_foreign_key "collection_items", "collections"
  add_foreign_key "collections", "users"
end
