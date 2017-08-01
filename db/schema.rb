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

ActiveRecord::Schema.define(version: 20170801203435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deliveries", force: :cascade do |t|
    t.datetime "due_date",    null: false
    t.string   "status"
    t.string   "cohort"
    t.integer  "prepper_id"
    t.integer  "reviewer_id"
    t.integer  "user_id"
    t.integer  "material_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["material_id"], name: "index_deliveries_on_material_id", using: :btree
    t.index ["prepper_id"], name: "index_deliveries_on_prepper_id", using: :btree
    t.index ["reviewer_id"], name: "index_deliveries_on_reviewer_id", using: :btree
    t.index ["user_id"], name: "index_deliveries_on_user_id", using: :btree
  end

  create_table "examples", force: :cascade do |t|
    t.text     "text",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_examples_on_user_id", using: :btree
  end

  create_table "materials", force: :cascade do |t|
    t.text     "material_type", null: false
    t.text     "name",          null: false
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_materials_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.text     "given_name"
    t.text     "family_name"
    t.text     "photo_url"
    t.text     "preferences"
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "github_username", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["token"], name: "index_users_on_token", unique: true, using: :btree
  end

  add_foreign_key "deliveries", "materials"
  add_foreign_key "deliveries", "users"
  add_foreign_key "examples", "users"
  add_foreign_key "materials", "users"
  add_foreign_key "profiles", "users"
end
