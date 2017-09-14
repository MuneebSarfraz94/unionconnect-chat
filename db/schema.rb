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

ActiveRecord::Schema.define(version: 20170913102717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_stat_statements"

  create_table "addresses", id: :serial, force: :cascade do |t|
    t.string "state", limit: 255
    t.string "city", limit: 255
    t.string "zip", limit: 255
    t.string "country", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.string "apt_number", limit: 255
    t.integer "addressable_id"
    t.string "addressable_type", limit: 255
    t.string "line1", limit: 255
    t.string "line2", limit: 255
    t.string "street_address", limit: 255
  end

  create_table "affiliates", id: :serial, force: :cascade do |t|
    t.string "formal_name", limit: 255
    t.string "common_name", limit: 255
    t.string "abbreviation", limit: 255
    t.text "address"
    t.string "website", limit: 255
    t.string "phone", limit: 255
    t.string "fax", limit: 255
    t.string "email", limit: 255
    t.string "slug", limit: 255
    t.string "leader_first_name", limit: 255
    t.string "leader_last_name", limit: 255
    t.string "leader_position", limit: 255
    t.string "leader_photo", limit: 255
    t.text "description"
    t.string "designation_number", limit: 255
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "affixes", id: :serial, force: :cascade do |t|
    t.integer "originable_id"
    t.string "originable_type", limit: 255
    t.integer "affixable_id"
    t.string "affixable_type", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "analytic_log_entries", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "controller", limit: 255
    t.string "action", limit: 255
    t.integer "local_id"
    t.integer "bargaining_unit_id"
    t.integer "location_id"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "analytic_report_locals", id: :serial, force: :cascade do |t|
    t.integer "local_id"
    t.datetime "created"
    t.datetime "authenticated"
    t.datetime "representation"
    t.datetime "news"
    t.datetime "events"
    t.datetime "contract"
    t.datetime "messages"
    t.integer "users_created"
    t.integer "users_authenticated"
    t.integer "users_news"
    t.integer "users_events"
    t.integer "users_contract"
    t.integer "users_messages"
    t.integer "users_representation"
    t.integer "users_authenticated_30"
    t.integer "users_news_30"
    t.integer "users_events_30"
    t.integer "users_contract_30"
    t.integer "users_messages_30"
    t.integer "users_representation_30"
    t.integer "users_authenticated_60"
    t.integer "users_news_60"
    t.integer "users_events_60"
    t.integer "users_contract_60"
    t.integer "users_messages_60"
    t.integer "users_representation_60"
    t.integer "users_authenticated_90"
    t.integer "users_news_90"
    t.integer "users_events_90"
    t.integer "users_contract_90"
    t.integer "users_messages_90"
    t.integer "users_representation_90"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "groups"
    t.datetime "politicians"
    t.datetime "resources"
    t.integer "users_resources"
    t.integer "users_groups"
    t.integer "users_politicians"
    t.integer "users_resources_30"
    t.integer "users_groups_30"
    t.integer "users_politicians_30"
    t.integer "users_resources_60"
    t.integer "users_groups_60"
    t.integer "users_politicians_60"
    t.integer "users_resources_90"
    t.integer "users_groups_90"
    t.integer "users_politicians_90"
  end

  create_table "analytic_report_users", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created"
    t.datetime "authenticated"
    t.datetime "representation"
    t.datetime "news"
    t.datetime "events"
    t.datetime "contract"
    t.datetime "messages"
    t.decimal "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "resources"
    t.datetime "groups"
    t.datetime "politicians"
  end

  create_table "apn_apps", id: :serial, force: :cascade do |t|
    t.text "apn_dev_cert"
    t.text "apn_prod_cert"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "national_id"
  end

  create_table "apn_device_groupings", id: :serial, force: :cascade do |t|
    t.integer "group_id"
    t.integer "device_id"
    t.index ["device_id"], name: "index_apn_device_groupings_on_device_id"
    t.index ["group_id", "device_id"], name: "index_apn_device_groupings_on_group_id_and_device_id"
    t.index ["group_id"], name: "index_apn_device_groupings_on_group_id"
  end

  create_table "apn_devices", id: :serial, force: :cascade do |t|
    t.string "token", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_registered_at"
    t.integer "app_id"
    t.integer "device_id"
    t.index ["token"], name: "index_apn_devices_on_token"
  end

  create_table "apn_group_notifications", id: :serial, force: :cascade do |t|
    t.integer "group_id", null: false
    t.string "device_language", limit: 255
    t.string "sound", limit: 255
    t.string "alert", limit: 255
    t.integer "badge"
    t.text "custom_properties"
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_apn_group_notifications_on_group_id"
  end

  create_table "apn_groups", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "app_id"
  end

  create_table "apn_notifications", id: :serial, force: :cascade do |t|
    t.integer "device_id", null: false
    t.integer "errors_nb", default: 0
    t.string "device_language", limit: 255
    t.string "sound", limit: 255
    t.string "alert", limit: 255
    t.integer "badge"
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "custom_properties"
    t.index ["device_id"], name: "index_apn_notifications_on_device_id"
  end

  create_table "apn_pull_notifications", id: :serial, force: :cascade do |t|
    t.integer "app_id"
    t.string "title", limit: 255
    t.string "content", limit: 255
    t.string "link", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "launch_notification"
  end

  create_table "app_modules", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.boolean "default_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description", limit: 255, default: ""
    t.string "alias", limit: 255
  end

  create_table "articles", id: :serial, force: :cascade do |t|
    t.integer "feed_id"
    t.integer "user_id"
    t.string "entry_id", limit: 255
    t.string "title", limit: 255
    t.string "url", limit: 255
    t.datetime "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.text "image"
    t.text "description"
    t.string "source_type", limit: 255
    t.string "visibility", limit: 255
    t.string "shortcode", limit: 20
    t.boolean "is_featured", default: false
    t.string "feature_image", limit: 255
    t.index ["entry_id"], name: "index_articles_on_entry_id"
    t.index ["feed_id"], name: "index_articles_on_feed_id"
    t.index ["shortcode"], name: "index_articles_on_shortcode", unique: true
    t.index ["source_type"], name: "index_articles_on_source_type"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "bargaining_unit_details", id: :serial, force: :cascade do |t|
    t.text "represents"
    t.text "address"
    t.integer "local_id"
    t.integer "owner_id"
    t.integer "bargaining_unit_id"
    t.string "contract_pdf", limit: 255
    t.text "contract_text"
    t.text "contract_articles"
    t.date "contract_expiration"
    t.string "contract_type", limit: 255
    t.text "locations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bargaining_units", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "local_id"
    t.string "name", limit: 255
    t.text "represents"
    t.text "address"
    t.string "contract_pdf", limit: 255
    t.text "contract_text"
    t.text "contract_articles"
    t.date "contract_expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "locations"
    t.integer "owner_id"
    t.string "slug", limit: 255
    t.string "contract_type", limit: 255
    t.index ["slug"], name: "index_bargaining_units_on_slug", unique: true
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.string "description", limit: 255
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.integer "external_resource_id"
    t.string "image", limit: 255
  end

  create_table "chat_messages", force: :cascade do |t|
    t.integer "sender_id"
    t.text "content"
    t.integer "conversation_id"
  end

  create_table "chat_participants", force: :cascade do |t|
    t.integer "conversation_id"
    t.integer "chatable_id"
    t.string "chatable_type"
  end

  create_table "contact_message_attachments", id: :serial, force: :cascade do |t|
    t.integer "contact_message_id"
    t.string "attachment", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unique_reference_identifier", limit: 255
  end

  create_table "contact_messages", id: :serial, force: :cascade do |t|
    t.integer "local_id"
    t.integer "bargaining_unit_id"
    t.integer "location_id"
    t.string "device_id", limit: 255
    t.string "name", limit: 255
    t.string "phone", limit: 255
    t.string "email", limit: 255
    t.text "message"
    t.string "scenario", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "client_id", limit: 255
    t.text "data"
    t.string "unique_photos_identifier", limit: 255
  end

  create_table "contract_articles", id: :serial, force: :cascade do |t|
    t.integer "bargaining_unit_id"
    t.string "title", limit: 255
    t.text "article"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weight"
    t.integer "contract_id"
  end

  create_table "contractables", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.string "parent_type", limit: 255
    t.integer "contract_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.string "contract_type", limit: 255
    t.date "contract_expiration"
    t.string "contract_pdf", limit: 255
    t.text "contract_text"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "user_id"
    t.string "content"
  end

  create_table "coverages", id: :serial, force: :cascade do |t|
    t.integer "articleable_id"
    t.string "articleable_type", limit: 255
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_form_field_fields", id: :serial, force: :cascade do |t|
    t.string "prompt", limit: 255
    t.text "description"
    t.text "validations"
    t.text "format"
    t.integer "custom_form_page_id"
    t.integer "number"
    t.string "css_classes", limit: 255
    t.text "custom_validations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["custom_form_page_id"], name: "index_custom_form_field_fields_on_custom_form_page_id"
    t.index ["format"], name: "index_custom_form_field_fields_on_format"
    t.index ["prompt"], name: "index_custom_form_field_fields_on_prompt"
    t.index ["validations"], name: "index_custom_form_field_fields_on_validations"
  end

  create_table "custom_form_field_options", id: :serial, force: :cascade do |t|
    t.text "description"
    t.integer "number"
    t.integer "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "correct"
    t.integer "weight"
    t.index ["description"], name: "index_custom_form_field_options_on_description"
    t.index ["field_id"], name: "index_custom_form_field_options_on_field_id"
    t.index ["number"], name: "index_custom_form_field_options_on_number"
  end

  create_table "custom_form_field_options_custom_form_submission_responses", id: false, force: :cascade do |t|
    t.integer "custom_form_field_option_id"
    t.integer "custom_form_submission_response_id"
    t.index ["custom_form_field_option_id"], name: "idx_field_options_submission_responses_on_field_option_id"
    t.index ["custom_form_submission_response_id"], name: "idx_options_submission_responses_on_submission_response_id"
  end

  create_table "custom_form_forms", id: :serial, force: :cascade do |t|
    t.integer "national_id"
    t.integer "user_id"
    t.string "title", limit: 255
    t.string "target_url", limit: 255
    t.text "css"
    t.text "js"
    t.boolean "active"
    t.datetime "published_at"
    t.string "mailer_from", limit: 255
    t.string "mailer_subject", limit: 255
    t.text "mailer_text"
    t.text "mailer_html"
    t.text "success_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "protected", default: true
    t.string "processor_emails", limit: 255, default: ""
    t.string "type", limit: 255
    t.datetime "publish_until"
    t.boolean "stepwise"
    t.integer "allowed_attempts"
    t.index ["active"], name: "index_custom_form_forms_on_active"
    t.index ["national_id"], name: "index_custom_form_forms_on_national_id"
    t.index ["published_at"], name: "index_custom_form_forms_on_published_at"
    t.index ["title"], name: "index_custom_form_forms_on_title"
    t.index ["user_id"], name: "index_custom_form_forms_on_user_id"
  end

  create_table "custom_form_pages", id: :serial, force: :cascade do |t|
    t.integer "number"
    t.integer "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_custom_form_pages_on_form_id"
    t.index ["number"], name: "index_custom_form_pages_on_number"
  end

  create_table "custom_form_submission_responses", id: :serial, force: :cascade do |t|
    t.text "data"
    t.integer "submission_id"
    t.integer "custom_form_field_field_id"
    t.integer "custom_form_field_option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "correct"
    t.string "attachment", limit: 255
    t.index ["custom_form_field_field_id"], name: "idx_form_submission_responses_on_form_field_field_id"
    t.index ["custom_form_field_option_id"], name: "idx_form_submission_responses_on_form_field_option_id"
    t.index ["submission_id"], name: "index_custom_form_submission_responses_on_submission_id"
  end

  create_table "custom_form_submission_submissions", id: :serial, force: :cascade do |t|
    t.text "data"
    t.integer "user_id"
    t.integer "custom_form_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "winner"
    t.integer "score"
    t.integer "owner_id"
    t.index ["custom_form_form_id"], name: "index_custom_form_submission_submissions_on_custom_form_form_id"
    t.index ["data"], name: "index_custom_form_submission_submissions_on_data"
    t.index ["user_id"], name: "index_custom_form_submission_submissions_on_user_id"
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0
    t.integer "attempts", default: 0
    t.text "handler"
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by", limit: 255
    t.string "queue", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "devices", id: :serial, force: :cascade do |t|
    t.string "device_id", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "local_id"
    t.integer "bargaining_unit_id"
    t.integer "location_id"
    t.string "device_type", limit: 255
    t.integer "owner_id"
    t.integer "language_id"
    t.integer "user_id"
    t.string "device_model", limit: 255
    t.string "device_manufacturer", limit: 255
    t.string "device_version", limit: 255
    t.string "device_uuid", limit: 255
    t.string "device_serial", limit: 255
    t.string "application_version", limit: 255, default: ""
    t.integer "sublocation_id"
    t.index ["device_manufacturer"], name: "index_devices_on_device_manufacturer"
    t.index ["device_model"], name: "index_devices_on_device_model"
    t.index ["device_serial"], name: "index_devices_on_device_serial"
    t.index ["device_uuid"], name: "index_devices_on_device_uuid"
    t.index ["device_version"], name: "index_devices_on_device_version"
  end

  create_table "devices_messages", id: :serial, force: :cascade do |t|
    t.integer "device_id"
    t.integer "message_id"
    t.boolean "read", default: false, null: false
    t.boolean "deleted", default: false
    t.index ["device_id", "message_id"], name: "index_devices_messages_on_device_id_and_message_id"
    t.index ["message_id"], name: "index_devices_messages_on_message_id"
  end

  create_table "directories", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "groupable_id"
    t.string "groupable_type", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.string "slug", limit: 255
    t.boolean "representation"
    t.string "visibility", limit: 255
    t.string "shortcode", limit: 20
    t.index ["owner_id"], name: "index_directories_on_owner_id"
    t.index ["representation"], name: "index_directories_on_representation"
    t.index ["shortcode"], name: "index_directories_on_shortcode", unique: true
    t.index ["slug"], name: "index_directories_on_slug", unique: true
    t.index ["visibility"], name: "index_directories_on_visibility"
  end

  create_table "dues_configurations", id: :serial, force: :cascade do |t|
    t.decimal "payable_amount", precision: 8, scale: 2
    t.integer "configurable_id"
    t.string "configurable_type", limit: 255
    t.text "dues_description"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dues_type", limit: 255, default: "", null: false
  end

  create_table "event_subscriptions", id: :serial, force: :cascade do |t|
    t.integer "status"
    t.integer "user_id"
    t.integer "device_id"
    t.integer "event_id"
    t.integer "tickets_quantity"
    t.decimal "per_ticket_cost", precision: 8, scale: 2
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_token", limit: 255
    t.decimal "amount_charged", precision: 8, scale: 2
    t.index ["device_id"], name: "index_event_subscriptions_on_device_id"
    t.index ["event_id"], name: "index_event_subscriptions_on_event_id"
    t.index ["status"], name: "index_event_subscriptions_on_status"
    t.index ["user_id"], name: "index_event_subscriptions_on_user_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.integer "eventable_id"
    t.string "eventable_type", limit: 255
    t.string "title", limit: 255
    t.text "location"
    t.datetime "event_start"
    t.datetime "event_end"
    t.text "description"
    t.string "url", limit: 255
    t.integer "owner_id"
    t.boolean "all_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.string "visibility", limit: 255
    t.boolean "has_event_end"
    t.integer "external_resource_id"
    t.datetime "last_sync_at"
    t.boolean "sync", default: true
    t.boolean "is_paid", default: false
    t.decimal "cost", precision: 8, scale: 2
    t.index ["slug"], name: "index_events_on_slug", unique: true
  end

  create_table "feeds", id: :serial, force: :cascade do |t|
    t.integer "local_id"
    t.string "title", limit: 255
    t.text "description"
    t.string "url", limit: 255
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "feedable_id"
    t.string "feedable_type", limit: 255
    t.boolean "operational"
    t.string "status", limit: 255
    t.string "visibility", limit: 255
  end

  create_table "gcm_apps", id: :serial, force: :cascade do |t|
    t.integer "national_id"
    t.string "api_key", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "app_name", limit: 255
    t.string "api_url", limit: 255
    t.string "delivery_format", limit: 255
    t.string "project_id", limit: 255
  end

  create_table "gcm_apps_gcm_devices", id: false, force: :cascade do |t|
    t.integer "gcm_app_id"
    t.integer "gcm_device_id"
    t.index ["gcm_app_id", "gcm_device_id"], name: "index_gcm_apps_gcm_devices_on_gcm_app_id_and_gcm_device_id"
    t.index ["gcm_device_id"], name: "index_gcm_apps_gcm_devices_on_gcm_device_id"
  end

  create_table "gcm_devices", id: :serial, force: :cascade do |t|
    t.string "registration_id", limit: 255, null: false
    t.datetime "last_registered_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "device_id"
    t.index ["registration_id"], name: "index_gcm_devices_on_registration_id", unique: true
  end

  create_table "gcm_notifications", id: :serial, force: :cascade do |t|
    t.integer "device_id", null: false
    t.string "collapse_key", limit: 255
    t.text "data"
    t.boolean "delay_while_idle"
    t.datetime "sent_at"
    t.integer "time_to_live"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_gcm_notifications_on_device_id"
  end

  create_table "group_associations", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.string "parent_type", limit: 255
    t.integer "child_id"
    t.string "child_type", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_group_associations_on_child_id"
    t.index ["child_type"], name: "index_group_associations_on_child_type"
    t.index ["parent_id"], name: "index_group_associations_on_parent_id"
    t.index ["parent_type"], name: "index_group_associations_on_parent_type"
  end

  create_table "group_subscriptions", id: :serial, force: :cascade do |t|
    t.integer "standard_group_id"
    t.integer "user_id"
    t.integer "local_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", id: :serial, force: :cascade do |t|
    t.text "name"
    t.string "type", limit: 255
    t.integer "user_id"
    t.string "visibility", limit: 255
    t.string "slug", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "national_id"
    t.text "description"
    t.boolean "private", default: true
    t.index ["type"], name: "index_groups_on_type"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "languages", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "dictionary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locals", id: :serial, force: :cascade do |t|
    t.string "formal_name", limit: 255
    t.string "common_name", limit: 255
    t.string "abbreviation", limit: 255
    t.text "address"
    t.string "phone", limit: 255
    t.string "toll_free_phone", limit: 255
    t.string "email", limit: 255
    t.string "facebook", limit: 255
    t.string "twitter", limit: 255
    t.string "youtube", limit: 255
    t.text "description"
    t.string "logo", limit: 255
    t.string "url", limit: 255
    t.string "designation_number", limit: 255
    t.date "founded"
    t.text "offices"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "national_id"
    t.integer "user_id"
    t.string "slug", limit: 255
    t.string "tag_alias", limit: 255
    t.string "twitter_access_token", limit: 255
    t.string "twitter_access_secret", limit: 255
    t.string "representation_option", limit: 255
    t.string "timezone", limit: 255
    t.integer "size"
    t.string "wp_key", limit: 255
    t.string "wp_site", limit: 255
    t.string "subdomain", limit: 255
    t.boolean "sync", default: false
    t.string "privacy_level", limit: 255, default: "public"
    t.boolean "unverified_member_login", default: false
    t.string "location_alias", limit: 255, default: "Locations"
    t.string "sublocation_alias", limit: 255, default: "Sublocations"
    t.boolean "enable_sublocations", default: false
    t.string "email_aliases", limit: 255
    t.boolean "enable_signup_notification", default: true
    t.integer "messages_default_permission", default: 0
    t.string "city", limit: 255
    t.string "state", limit: 255
    t.integer "plan_id"
    t.boolean "auto_approve_accounts", default: false
    t.string "stripe_account_id", limit: 255
    t.string "stripe_account_secret", limit: 255
    t.string "stripe_account_publishable", limit: 255
    t.index ["abbreviation"], name: "index_locals_on_abbreviation"
    t.index ["email"], name: "index_locals_on_email"
    t.index ["national_id"], name: "index_locals_on_national_id"
    t.index ["plan_id"], name: "index_locals_on_plan_id"
    t.index ["slug"], name: "index_locals_on_slug", unique: true
    t.index ["user_id"], name: "index_locals_on_user_id"
    t.index ["wp_key"], name: "index_locals_on_wp_key"
  end

  create_table "locals_custom_form_forms", id: false, force: :cascade do |t|
    t.integer "local_id"
    t.integer "custom_form_form_id"
    t.index ["custom_form_form_id"], name: "index_locals_custom_form_forms_on_custom_form_form_id"
    t.index ["local_id"], name: "index_locals_custom_form_forms_on_local_id"
  end

  create_table "locals_users", id: false, force: :cascade do |t|
    t.integer "local_id"
    t.integer "user_id"
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.integer "locatable_id"
    t.string "locatable_type", limit: 255
    t.string "name", limit: 255
    t.text "address"
    t.string "phone", limit: 255
    t.string "fax", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.string "slug", limit: 255
    t.boolean "enable_master_contract", default: true
    t.string "website", limit: 255
    t.index ["slug"], name: "index_locations_on_slug", unique: true
  end

  create_table "membership_form_forms", id: :serial, force: :cascade do |t|
    t.integer "local_id"
    t.integer "owner_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", limit: 255
    t.string "target_url", limit: 255
    t.text "css"
    t.integer "national_id"
    t.text "js"
  end

  create_table "membership_form_pages", id: :serial, force: :cascade do |t|
    t.integer "number"
    t.integer "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mailer_from", limit: 255
    t.string "mailer_subject", limit: 255
    t.text "mailer_text"
    t.text "mailer_html"
  end

  create_table "membership_question_choices", id: :serial, force: :cascade do |t|
    t.text "description"
    t.integer "number"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "membership_question_choices_membership_signup_responses", id: false, force: :cascade do |t|
    t.integer "membership_question_choice_id"
    t.integer "membership_signup_response_id"
  end

  create_table "membership_question_questions", id: :serial, force: :cascade do |t|
    t.string "prompt", limit: 255
    t.text "description"
    t.text "validations"
    t.text "format"
    t.integer "membership_form_page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "email"
    t.boolean "password"
    t.boolean "local"
    t.boolean "bargaining_unit"
    t.boolean "location"
    t.integer "number"
    t.boolean "first_name"
    t.boolean "last_name"
    t.boolean "phone"
    t.boolean "password_confirmation"
    t.string "css_classes", limit: 255
    t.string "custom_validations", limit: 255
    t.boolean "u_number", default: false
  end

  create_table "membership_signup_responses", id: :serial, force: :cascade do |t|
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "signup_id"
    t.integer "membership_question_question_id"
    t.integer "membership_question_choice_id"
  end

  create_table "membership_signup_signups", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "membership_form_form_id"
    t.text "data"
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.integer "messageable_id"
    t.string "messageable_type", limit: 255
    t.text "message"
    t.string "url", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.string "visibility", limit: 255
    t.boolean "processed", default: false
  end

  create_table "messagings", id: :serial, force: :cascade do |t|
    t.integer "message_id"
    t.integer "messageable_id"
    t.string "messageable_type", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "module_settings", id: :serial, force: :cascade do |t|
    t.string "registrable", limit: 255, null: false
    t.string "module_description", limit: 255
    t.string "module_icon", limit: 255
    t.integer "module_weight"
    t.integer "module_id"
    t.boolean "enabled", default: true
    t.integer "local_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "module_icon_color", limit: 255
    t.index ["registrable", "module_id", "local_id"], name: "index_module_settings_on_registrable_and_module_id_and_local_id", unique: true
  end

  create_table "nationals", id: :serial, force: :cascade do |t|
    t.string "formal_name", limit: 255
    t.string "common_name", limit: 255
    t.string "abbreviation", limit: 255
    t.text "address"
    t.string "phone", limit: 255
    t.string "email", limit: 255
    t.string "facebook", limit: 255
    t.string "twitter", limit: 255
    t.string "youtube", limit: 255
    t.text "description"
    t.string "logo", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url", limit: 255
    t.string "designation", limit: 255
    t.string "whitelabel", limit: 255
    t.string "app_id", limit: 255
    t.boolean "single_local"
    t.text "css"
    t.boolean "test_mode"
    t.boolean "membership_module"
    t.boolean "main_module"
    t.string "base_color", limit: 255
    t.boolean "customized_registration", default: false
    t.boolean "anonymous_login", default: true
    t.string "qr_key", limit: 255
    t.string "play_store", limit: 255
    t.string "app_store", limit: 255
    t.boolean "custom_form_module", default: false
    t.integer "paying_for", default: 0
    t.string "ios_app_version", limit: 255, default: "1.0.0", null: false
    t.string "android_app_version", limit: 255, default: "1.0.0", null: false
    t.boolean "has_imported_users", default: false
    t.index ["abbreviation"], name: "index_nationals_on_abbreviation", unique: true
    t.index ["android_app_version"], name: "index_nationals_on_android_app_version"
    t.index ["app_id"], name: "index_nationals_on_app_id", unique: true
    t.index ["app_store"], name: "index_nationals_on_app_store"
    t.index ["base_color"], name: "index_nationals_on_base_color"
    t.index ["common_name"], name: "index_nationals_on_common_name"
    t.index ["email"], name: "index_nationals_on_email"
    t.index ["formal_name"], name: "index_nationals_on_formal_name"
    t.index ["ios_app_version"], name: "index_nationals_on_ios_app_version"
    t.index ["phone"], name: "index_nationals_on_phone"
    t.index ["play_store"], name: "index_nationals_on_play_store"
    t.index ["qr_key"], name: "index_nationals_on_qr_key"
    t.index ["single_local"], name: "index_nationals_on_single_local"
  end

  create_table "nationals_users", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "national_id"
  end

  create_table "oauth_access_grants", id: :serial, force: :cascade do |t|
    t.integer "resource_owner_id", null: false
    t.integer "application_id", null: false
    t.string "token", limit: 255, null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes", limit: 255
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", id: :serial, force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id"
    t.string "token", limit: 255, null: false
    t.string "refresh_token", limit: 255
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes", limit: 255
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "uid", limit: 255, null: false
    t.string "secret", limit: 255, null: false
    t.text "redirect_uri", null: false
    t.string "scopes", limit: 255, default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.string "subtitle", limit: 255
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
  end

  create_table "payments", id: :serial, force: :cascade do |t|
    t.integer "plan_id", null: false
    t.integer "local_id", null: false
    t.decimal "amount", precision: 8, scale: 2, null: false
    t.string "month", limit: 255
    t.string "stripe_customer_email", limit: 255
    t.string "stripe_customer_id", limit: 255
    t.string "stripe_customer_subscription_id", limit: 255
    t.datetime "current_period_end"
    t.datetime "current_period_start"
    t.datetime "start"
    t.string "status", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments_logs", id: :serial, force: :cascade do |t|
    t.integer "plan_id", null: false
    t.integer "local_id", null: false
    t.decimal "amount", precision: 8, scale: 2, null: false
    t.string "month", limit: 255
    t.string "stripe_customer_email", limit: 255
    t.string "stripe_customer_id", limit: 255
    t.string "stripe_customer_subscription_id", limit: 255
    t.datetime "current_period_end"
    t.datetime "current_period_start"
    t.datetime "start"
    t.string "status", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "title", limit: 255
    t.string "phone1", limit: 255
    t.string "phone2", limit: 255
    t.string "email", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo", limit: 255
    t.integer "owner_id"
    t.string "slug", limit: 255
    t.text "bio"
    t.integer "affiliate_id"
    t.string "phone1_ext", limit: 255
    t.string "phone2_ext", limit: 255
    t.index ["slug"], name: "index_people_on_slug", unique: true
  end

  create_table "plans", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "uuid", limit: 255, null: false
    t.decimal "amount", precision: 8, scale: 2, null: false
    t.string "interval", limit: 255, default: "month", null: false
    t.string "currency", limit: 255, default: "usd", null: false
    t.integer "interval_count", default: 1
    t.text "meta_data"
    t.string "statement_descriptor", limit: 255
    t.integer "trial_period_days"
    t.text "app_module_ids", default: "--- []\n"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "politicians", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.string "name", limit: 255
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.string "classification", limit: 255
    t.text "phones", default: "--- []\n"
    t.text "urls", default: "--- []\n"
    t.text "emails", default: "--- []\n"
    t.text "channels", default: "--- []\n"
    t.string "party", limit: 255
    t.string "photo", limit: 255
  end

  create_table "positions", id: :serial, force: :cascade do |t|
    t.integer "directory_id"
    t.integer "person_id"
    t.string "title", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.integer "weight"
  end

  create_table "redactor_assets", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "data_file_name", limit: 255, null: false
    t.string "data_content_type", limit: 255
    t.integer "data_file_size"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_redactor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type"
  end

  create_table "request_unions", id: :serial, force: :cascade do |t|
    t.string "union_name", limit: 255, null: false
    t.string "union_website", limit: 255
    t.string "representative_name", limit: 255, null: false
    t.string "representative_position", limit: 255, null: false
    t.string "representative_email", limit: 255, null: false
    t.string "representative_phone", limit: 255, null: false
    t.boolean "authorized_person", null: false
    t.boolean "single_local"
    t.boolean "custom_app", null: false
    t.boolean "charged"
    t.decimal "setup_fee", precision: 8, scale: 2, null: false
    t.string "stripe_customer_email", limit: 255
    t.string "stripe_customer_id", limit: 255
    t.string "stripe_customer_charge_id", limit: 255
    t.string "stripe_token", limit: 255
    t.text "note"
    t.integer "national_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plan_id"
    t.index ["charged"], name: "index_request_unions_on_charged"
    t.index ["custom_app"], name: "index_request_unions_on_custom_app"
    t.index ["national_id"], name: "index_request_unions_on_national_id"
    t.index ["single_local"], name: "index_request_unions_on_single_local"
  end

  create_table "resources", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.text "description"
    t.string "url", limit: 255
    t.string "nature", limit: 255
    t.integer "user_id"
    t.integer "owner_id"
    t.string "visibility", limit: 255
    t.datetime "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document", limit: 255
    t.string "shortcode", limit: 20
    t.integer "external_resource_id"
    t.string "document_tmp", limit: 255
    t.string "feature_image", limit: 255
    t.index ["shortcode"], name: "index_resources_on_shortcode", unique: true
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "description", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.index ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.string "var", limit: 255, null: false
    t.text "value"
    t.integer "target_id", null: false
    t.string "target_type", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["target_type", "target_id", "var"], name: "index_settings_on_target_type_and_target_id_and_var", unique: true
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string "taggable_type", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
  end

  create_table "tips", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "action", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "translations", id: :serial, force: :cascade do |t|
    t.integer "language_id"
    t.integer "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "crypted_password", limit: 255
    t.string "password_salt", limit: 255
    t.string "persistence_token", limit: 255
    t.boolean "confirmed"
    t.string "perishable_token", limit: 255
    t.string "slug", limit: 255
    t.boolean "approved"
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.date "birthday"
    t.integer "member_of_local_id"
    t.integer "member_of_bargaining_unit_id"
    t.integer "member_of_location_id"
    t.boolean "verified"
    t.string "single_access_token", limit: 255
    t.string "phone", limit: 255
    t.string "u_number", limit: 255, default: ""
    t.integer "member_of_sublocation_id"
    t.boolean "demo_user", default: false
    t.boolean "help_message", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["single_access_token"], name: "index_users_on_single_access_token"
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  create_table "users_dues_payments", id: :serial, force: :cascade do |t|
    t.decimal "paid_amount", precision: 8, scale: 2
    t.integer "dues_configuration_id"
    t.integer "user_id"
    t.integer "owner_id"
    t.text "description"
    t.json "meta_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", limit: 255
    t.integer "device_id"
  end

  create_table "users_politicians", id: :serial, force: :cascade do |t|
    t.integer "politician_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["politician_id"], name: "index_users_politicians_on_politician_id"
    t.index ["user_id", "politician_id"], name: "index_users_politicians_on_user_id_and_politician_id"
  end

end
