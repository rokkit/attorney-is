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

ActiveRecord::Schema.define(:version => 20131115191044) do

  create_table "domains", :force => true do |t|
    t.string   "name"
    t.integer  "distinct_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "address"
    t.string   "phone"
    t.string   "email"
    t.string   "city"
    t.string   "fio_major"
  end

  create_table "inform_mails", :force => true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "sms_body"
    t.integer  "sender_id"
  end

  add_index "inform_mails", ["user_id"], :name => "index_inform_mails_on_user_id"

  create_table "meetings", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.date     "will_be_on"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.time     "will_be_at"
    t.integer  "domain_id"
    t.string   "judge"
    t.text     "client"
  end

  create_table "request_meetings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "meeting_id"
    t.integer  "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "confirm_token"
  end

  add_index "request_meetings", ["meeting_id"], :name => "index_request_meetings_on_meeting_id"
  add_index "request_meetings", ["user_id"], :name => "index_request_meetings_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.datetime "start_date"
    t.datetime "end_date"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                                              :default => "", :null => false
    t.string   "encrypted_password",                                 :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "fio"
    t.datetime "birthdate"
    t.string   "register_number"
    t.integer  "phone"
    t.string   "address"
    t.boolean  "admin"
    t.datetime "created_at",                                                         :null => false
    t.datetime "updated_at",                                                         :null => false
    t.string   "invitation_token",                     :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.boolean  "change_password"
    t.integer  "request_limit",                                      :default => 3,  :null => false
    t.string   "attorney_formation"
    t.string   "attorney_consult"
    t.string   "avatar"
    t.datetime "start_access"
    t.datetime "end_access"
    t.integer  "number_certificate"
    t.string   "firstname"
    t.string   "secondname"
    t.string   "lastname"
    t.date     "date_adding_to_register"
    t.date     "date_entry_adding_to_register"
    t.integer  "number_entry_adding_from_register"
    t.string   "entry_adding_from_register"
    t.date     "date_excluding_from_register"
    t.date     "date_entry_excluding_from_register"
    t.integer  "number_entry_excluding_from_register"
    t.string   "entry_excluding_from_register"
    t.date     "date_creating_of_certificate"
    t.integer  "status"
    t.date     "date_adding_status"
    t.date     "date_entry_adding_status"
    t.integer  "number_entry_adding_status"
    t.date     "date_ending_status"
    t.date     "date_entry_ending_status"
    t.integer  "number_ending_status"
    t.string   "entry_ending_status"
    t.integer  "inn"
    t.integer  "sps"
    t.boolean  "gender"
    t.string   "nationality"
    t.date     "birthday"
    t.string   "birthplace"
    t.string   "document"
    t.string   "serial_document"
    t.string   "number_document"
    t.date     "document_created"
    t.string   "who_created_document"
    t.string   "who_created_document_code"
    t.string   "official_address_for_contact"
    t.string   "country"
    t.string   "region"
    t.string   "subdivion_russian_federation"
    t.integer  "district_id"
    t.integer  "index"
    t.string   "city"
    t.string   "street"
    t.string   "house_number"
    t.string   "house_second_number"
    t.string   "appartement_number"
    t.string   "city_punkt"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "fax_phone"
    t.string   "phone_2"
    t.string   "mobile_phone"
    t.string   "site"
    t.string   "post_address"
    t.string   "additional_info"
    t.string   "university"
    t.date     "diplom_created"
    t.string   "dimplom_serial"
    t.integer  "diplom_number"
    t.string   "academic_title"
    t.string   "degree"
    t.string   "experience"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token", :unique => true
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
