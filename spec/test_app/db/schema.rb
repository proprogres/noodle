# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161124002404) do

  create_table "noodle_node_class_properties", force: :cascade do |t|
    t.string   "name",          null: false
    t.text     "properties"
    t.integer  "node_class_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "noodle_node_class_properties", ["node_class_id"], name: "index_noodle_node_class_properties_on_node_class_id"

  create_table "noodle_node_classes", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "noodle_node_properties", force: :cascade do |t|
    t.integer  "node_id",                          null: false
    t.integer  "node_class_property_id",           null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.binary   "binary_value"
    t.boolean  "boolean_value"
    t.date     "date_value"
    t.datetime "datetime_value"
    t.decimal  "decimal_value"
    t.float    "float_value"
    t.integer  "integer_value"
    t.integer  "bigint_value",           limit: 8
    t.string   "string_value"
    t.text     "text_value"
    t.time     "time_value"
    t.datetime "timestamp_value"
  end

  add_index "noodle_node_properties", ["node_class_property_id"], name: "index_noodle_node_properties_on_node_class_property_id"
  add_index "noodle_node_properties", ["node_id"], name: "index_noodle_node_properties_on_node_id"

  create_table "noodle_nodes", force: :cascade do |t|
    t.integer  "node_class_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "noodle_nodes", ["node_class_id"], name: "index_noodle_nodes_on_node_class_id"

end
