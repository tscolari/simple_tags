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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121011020236011199) do

  create_table "dummy_object2s", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dummy_object3s", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dummy_objects", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "simple_tags_taggings", :force => true do |t|
    t.integer "tag_id",        :null => false
    t.integer "taggable_id",   :null => false
    t.string  "taggable_type", :null => false
  end

  add_index "simple_tags_taggings", ["tag_id", "taggable_type", "taggable_id"], :name => "taggings_unq_idx", :unique => true
  add_index "simple_tags_taggings", ["taggable_type", "taggable_id"], :name => "taggings_taggable_idx"

  create_table "simple_tags_tags", :force => true do |t|
    t.string  "name",                          :null => false
    t.integer "taggings_count", :default => 0
  end

  add_index "simple_tags_tags", ["name"], :name => "index_simple_tags_tags_on_name", :unique => true

end
