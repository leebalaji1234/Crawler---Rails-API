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

ActiveRecord::Schema.define(version: 20160404115821) do

  create_table "channels", force: :cascade do |t|
    t.string   "channel_name", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "company_name", limit: 255
    t.string   "description",  limit: 1000
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "domains", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "nlp_configs", force: :cascade do |t|
    t.integer  "language",            limit: 1
    t.string   "lod",                 limit: 255
    t.string   "general_annotations", limit: 255
    t.string   "entities_extract",    limit: 255
    t.string   "opendata",            limit: 255
    t.string   "spotting_method",     limit: 255
    t.string   "linking_method",      limit: 255
    t.string   "disambiguation",      limit: 255
    t.integer  "project_id",          limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "nlp_configs", ["project_id"], name: "index_nlp_configs_on_project_id", using: :btree

  create_table "ontologies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "url",        limit: 255
    t.integer  "domain_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "ontologies", ["domain_id"], name: "index_ontologies_on_domain_id", using: :btree

  create_table "process_statuses", force: :cascade do |t|
    t.string   "process_status", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "project_domains", force: :cascade do |t|
    t.string   "domain_id",  limit: 255
    t.integer  "project_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "project_domains", ["project_id"], name: "index_project_domains_on_project_id", using: :btree
  add_index "project_domains", ["user_id"], name: "index_project_domains_on_user_id", using: :btree

  create_table "project_ontologies", force: :cascade do |t|
    t.string   "ontology_id", limit: 255
    t.integer  "project_id",  limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "taxonomies",  limit: 2000
  end

  add_index "project_ontologies", ["project_id"], name: "index_project_ontologies_on_project_id", using: :btree
  add_index "project_ontologies", ["user_id"], name: "index_project_ontologies_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "project_name",        limit: 255
    t.string   "project_description", limit: 1000
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "scheduler_types", force: :cascade do |t|
    t.string   "scheduler_name", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "social_process_logs", force: :cascade do |t|
    t.integer  "project_id",        limit: 4
    t.integer  "user_id",           limit: 4
    t.integer  "source_social_id",  limit: 4
    t.integer  "process_status_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "social_process_logs", ["process_status_id"], name: "index_social_process_logs_on_process_status_id", using: :btree
  add_index "social_process_logs", ["project_id"], name: "index_social_process_logs_on_project_id", using: :btree
  add_index "social_process_logs", ["source_social_id"], name: "index_social_process_logs_on_source_social_id", using: :btree
  add_index "social_process_logs", ["user_id"], name: "index_social_process_logs_on_user_id", using: :btree

  create_table "source_socials", force: :cascade do |t|
    t.string   "collection_name",      limit: 45
    t.string   "fb_like_page_id",      limit: 400
    t.string   "access_token",         limit: 400
    t.integer  "fb_feed_limit",        limit: 4
    t.string   "consumer_key",         limit: 400
    t.string   "consumer_secret",      limit: 400
    t.string   "access_secret",        limit: 400
    t.string   "geo_lat",              limit: 45
    t.string   "geo_lon",              limit: 45
    t.string   "twitter_hastags",      limit: 2000
    t.integer  "instagram_start_time", limit: 4
    t.integer  "instagram_end_time",   limit: 4
    t.string   "instagram_tags",       limit: 2000
    t.integer  "project_id",           limit: 4
    t.integer  "channel_id",           limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "twitter_keywords",     limit: 2000
  end

  add_index "source_socials", ["channel_id"], name: "index_source_socials_on_channel_id", using: :btree
  add_index "source_socials", ["project_id"], name: "index_source_socials_on_project_id", using: :btree

  create_table "source_webs", force: :cascade do |t|
    t.string   "url_collection_name", limit: 45
    t.string   "url_collection",      limit: 2000
    t.integer  "scheduler_type_id",   limit: 4
    t.integer  "project_id",          limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "source_webs", ["project_id"], name: "index_source_webs_on_project_id", using: :btree
  add_index "source_webs", ["scheduler_type_id"], name: "index_source_webs_on_scheduler_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",          limit: 255
    t.string   "password",          limit: 255
    t.string   "first_name",        limit: 255
    t.string   "last_name",         limit: 255
    t.integer  "is_active",         limit: 1
    t.integer  "is_delete_account", limit: 1
    t.integer  "company_id",        limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree

  create_table "web_process_logs", force: :cascade do |t|
    t.integer  "source_web_id",     limit: 4
    t.integer  "process_status_id", limit: 4
    t.integer  "project_id",        limit: 4
    t.integer  "user_id",           limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "web_process_logs", ["process_status_id"], name: "index_web_process_logs_on_process_status_id", using: :btree
  add_index "web_process_logs", ["project_id"], name: "index_web_process_logs_on_project_id", using: :btree
  add_index "web_process_logs", ["source_web_id"], name: "index_web_process_logs_on_source_web_id", using: :btree
  add_index "web_process_logs", ["user_id"], name: "index_web_process_logs_on_user_id", using: :btree

  add_foreign_key "nlp_configs", "projects"
  add_foreign_key "ontologies", "domains"
  add_foreign_key "project_domains", "projects"
  add_foreign_key "project_domains", "users"
  add_foreign_key "project_ontologies", "projects"
  add_foreign_key "project_ontologies", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "social_process_logs", "process_statuses"
  add_foreign_key "social_process_logs", "projects"
  add_foreign_key "social_process_logs", "source_socials"
  add_foreign_key "social_process_logs", "users"
  add_foreign_key "source_socials", "channels"
  add_foreign_key "source_socials", "projects"
  add_foreign_key "source_webs", "projects"
  add_foreign_key "source_webs", "scheduler_types"
  add_foreign_key "users", "companies"
  add_foreign_key "web_process_logs", "process_statuses"
  add_foreign_key "web_process_logs", "projects"
  add_foreign_key "web_process_logs", "source_webs"
  add_foreign_key "web_process_logs", "users"
end
