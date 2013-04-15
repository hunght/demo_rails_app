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

ActiveRecord::Schema.define(:version => 20130415090825) do

  create_table "branch", :force => true do |t|
    t.string  "name",                                                :null => false
    t.string  "alias",                                               :null => false
    t.integer "shop_id",                                             :null => false
    t.string  "image"
    t.string  "address",                                             :null => false
    t.integer "city_id",                                             :null => false
    t.integer "district_id",                                         :null => false
    t.time    "time_open"
    t.time    "time_close"
    t.integer "price_avg_from"
    t.integer "price_avg_to"
    t.string  "phone"
    t.string  "latlng",                                              :null => false
    t.string  "direction"
    t.text    "special_content"
    t.integer "space",                                               :null => false
    t.boolean "for_children"
    t.integer "waiting_start",   :limit => 1
    t.integer "waiting_end",     :limit => 1
    t.string  "holiday"
    t.integer "year"
    t.integer "index",                                               :null => false
    t.integer "comment_count",                 :default => 0,        :null => false
    t.integer "event_count",                   :default => 0,        :null => false
    t.integer "item_count",                    :default => 0,        :null => false
    t.integer "viewed",                        :default => 1,        :null => false
    t.integer "viewed_week",                   :default => 1,        :null => false
    t.integer "viewed_month",                  :default => 1,        :null => false
    t.string  "status",          :limit => 7,  :default => "ENABLE", :null => false
    t.string  "insert_type",     :limit => 12
    t.integer "manager_id"
    t.integer "user_id"
    t.boolean "has_reporting",                 :default => false,    :null => false
    t.text    "note"
    t.boolean "has_note",                      :default => false,    :null => false
    t.integer "foody_id"
  end

  add_index "branch", ["city_id"], :name => "FK_store__city_id"
  add_index "branch", ["district_id"], :name => "FK_store__district_id"
  add_index "branch", ["foody_id"], :name => "foody_id", :unique => true
  add_index "branch", ["manager_id"], :name => "manager_id"
  add_index "branch", ["shop_id", "status"], :name => "IDX_shop_id__status"
  add_index "branch", ["shop_id"], :name => "FK_store_shop_id"
  add_index "branch", ["user_id"], :name => "user_id"

  create_table "branch_has_param", :id => false, :force => true do |t|
    t.integer "branch_id",       :null => false
    t.integer "param_id",        :null => false
    t.integer "param_parent_id"
    t.integer "group_id",        :null => false
  end

  add_index "branch_has_param", ["group_id"], :name => "group_id"
  add_index "branch_has_param", ["param_id"], :name => "param_id"

  create_table "branch_image", :force => true do |t|
    t.integer   "branch_id",                                       :null => false
    t.integer   "shop_id",                                         :null => false
    t.string    "image",                                           :null => false
    t.string    "group",      :limit => 10, :default => "OTHER",   :null => false
    t.boolean   "is_cover",                                        :null => false
    t.integer   "comment_id"
    t.timestamp "created",                                         :null => false
    t.string    "status",     :limit => 7,  :default => "DISABLE", :null => false
  end

  add_index "branch_image", ["branch_id", "image"], :name => "branch_id_image"
  add_index "branch_image", ["branch_id"], :name => "branch_id"
  add_index "branch_image", ["comment_id"], :name => "comment_id"
  add_index "branch_image", ["image"], :name => "image", :unique => true

  create_table "branch_in_cat", :id => false, :force => true do |t|
    t.integer "branch_id", :null => false
    t.integer "cat_id",    :null => false
    t.integer "shop_id",   :null => false
  end

  add_index "branch_in_cat", ["cat_id"], :name => "cat_id"
  add_index "branch_in_cat", ["shop_id"], :name => "branch_in_cat_ibfk_3"

  create_table "branch_near_public_location", :id => false, :force => true do |t|
    t.integer "branch_id",          :null => false
    t.integer "public_location_id", :null => false
    t.integer "district_id",        :null => false
  end

  add_index "branch_near_public_location", ["public_location_id"], :name => "public_location_id"

  create_table "branch_sibling", :id => false, :force => true do |t|
    t.integer "branch_id",      :null => false
    t.integer "branch_sibling", :null => false
  end

  add_index "branch_sibling", ["branch_sibling"], :name => "branch_sibling_ibfk_2"

  create_table "cat", :force => true do |t|
    t.string  "name",  :null => false
    t.integer "index", :null => false
  end

  create_table "city", :force => true do |t|
    t.string  "name",         :limit => 50,                :null => false
    t.string  "name_2",       :limit => 50
    t.string  "alias",        :limit => 50,                :null => false
    t.integer "foody_id",                                  :null => false
    t.string  "foody_name",   :limit => 50,                :null => false
    t.string  "foody_alias",  :limit => 50,                :null => false
    t.integer "foody_count",                               :null => false
    t.string  "latlng",       :limit => 50,                :null => false
    t.integer "index",                                     :null => false
    t.string  "group",        :limit => 8,                 :null => false
    t.integer "branch_count",               :default => 0, :null => false
  end

  create_table "comment", :force => true do |t|
    t.string   "title"
    t.text     "content",                                            :null => false
    t.datetime "created",                                            :null => false
    t.integer  "user_id",                                            :null => false
    t.integer  "like_count",                                         :null => false
    t.integer  "dislike_count",                                      :null => false
    t.integer  "branch_id",                                          :null => false
    t.integer  "shop_id",                                            :null => false
    t.integer  "parent_id"
    t.string   "guest"
    t.string   "money"
    t.string   "status",         :limit => 7,  :default => "ENABLE", :null => false
    t.string   "insert_type",    :limit => 11
    t.string   "foody_username"
  end

  add_index "comment", ["branch_id"], :name => "comment_ibfk_2"
  add_index "comment", ["created"], :name => "created"
  add_index "comment", ["parent_id"], :name => "comment_ibfk_3"
  add_index "comment", ["shop_id"], :name => "comment_ibfk_4"
  add_index "comment", ["user_id"], :name => "user_id"

  create_table "coupon", :force => true do |t|
    t.integer  "branch_id",                  :null => false
    t.integer  "shop_id",                    :null => false
    t.string   "code",                       :null => false
    t.string   "name",                       :null => false
    t.string   "type",        :limit => 7,   :null => false
    t.integer  "value",                      :null => false
    t.integer  "money_min"
    t.integer  "use_number"
    t.integer  "used_number"
    t.datetime "start"
    t.datetime "end"
    t.string   "status",      :limit => 7
    t.string   "apply",       :limit => 4,   :null => false
    t.string   "apply_id",    :limit => 500
  end

  add_index "coupon", ["branch_id"], :name => "branch_id"
  add_index "coupon", ["shop_id", "code"], :name => "UK_code", :unique => true
  add_index "coupon", ["shop_id", "status"], :name => "IDX_shop_id_status"

  create_table "district", :force => true do |t|
    t.integer "foody_id",                   :null => false
    t.string  "name",         :limit => 50, :null => false
    t.string  "foody_name",   :limit => 50, :null => false
    t.integer "city_id",                    :null => false
    t.string  "alias",        :limit => 50, :null => false
    t.string  "latlng",       :limit => 50, :null => false
    t.integer "index",                      :null => false
    t.integer "branch_count",               :null => false
  end

  add_index "district", ["city_id"], :name => "FK_district__city_id"

  create_table "district_has_public_location", :id => false, :force => true do |t|
    t.integer "district_id",        :null => false
    t.integer "public_location_id", :null => false
    t.integer "city_id",            :null => false
  end

  add_index "district_has_public_location", ["public_location_id"], :name => "district_has_public_location_ibfk_2"

  create_table "event", :force => true do |t|
    t.string   "title",                                        :null => false
    t.integer  "shop_id",                                      :null => false
    t.integer  "branch_id",                                    :null => false
    t.integer  "user_id",                                      :null => false
    t.boolean  "hot",                    :default => false,    :null => false
    t.text     "desc",                                         :null => false
    t.text     "content",                                      :null => false
    t.string   "image",                                        :null => false
    t.datetime "created",                                      :null => false
    t.string   "status",    :limit => 7, :default => "ENABLE", :null => false
  end

  add_index "event", ["branch_id"], :name => "event_ibfk_1"
  add_index "event", ["shop_id"], :name => "event_ibfk_3"
  add_index "event", ["user_id"], :name => "user_id"

  create_table "event_in_cat", :id => false, :force => true do |t|
    t.integer "event_id", :null => false
    t.integer "cat_id",   :null => false
  end

  add_index "event_in_cat", ["cat_id"], :name => "cat_id"

  create_table "foody", :primary_key => "pk", :force => true do |t|
    t.integer  "id"
    t.string   "city_alias", :limit => 50,                              :null => false
    t.string   "alias",                                                 :null => false
    t.integer  "page",                                                  :null => false
    t.text     "data",       :limit => 2147483647,                      :null => false
    t.datetime "created",                                               :null => false
    t.integer  "benmark",                                               :null => false
    t.integer  "request",                                               :null => false
    t.integer  "insert",                                                :null => false
    t.string   "status",     :limit => 10,         :default => "CRAWL", :null => false
  end

  add_index "foody", ["city_alias", "alias"], :name => "key", :unique => true
  add_index "foody", ["id"], :name => "id", :unique => true
  add_index "foody", ["status", "pk"], :name => "pk"
  add_index "foody", ["status"], :name => "status_2"

  create_table "foody_branch", :force => true do |t|
    t.integer "foody_id",                                         :null => false
    t.integer "foody_branch",                                     :null => false
    t.string  "status",       :limit => 9, :default => "PENDING", :null => false
  end

  add_index "foody_branch", ["foody_id", "foody_branch"], :name => "foody_id", :unique => true
  add_index "foody_branch", ["status"], :name => "status"

  create_table "item", :force => true do |t|
    t.integer  "branch_id",                                 :null => false
    t.integer  "shop_id",                                   :null => false
    t.integer  "menu_id"
    t.string   "code"
    t.string   "name",                                      :null => false
    t.string   "alias",                                     :null => false
    t.string   "image"
    t.integer  "price"
    t.integer  "price_old"
    t.integer  "percent_bonus"
    t.datetime "created",                                   :null => false
    t.datetime "changed",                                   :null => false
    t.boolean  "is_deal",                                   :null => false
    t.text     "desc"
    t.text     "content"
    t.integer  "view",                       :default => 0, :null => false
    t.integer  "index",                                     :null => false
    t.string   "status",        :limit => 7,                :null => false
  end

  add_index "item", ["branch_id"], :name => "branch_id"
  add_index "item", ["created"], :name => "IDX_created"
  add_index "item", ["id", "shop_id"], :name => "UK__item_shop_id", :unique => true
  add_index "item", ["menu_id"], :name => "item_ibfk_3"
  add_index "item", ["shop_id", "status"], :name => "IDX_shop_id_enable"
  add_index "item", ["shop_id"], :name => "FK_item__shop_id"

  create_table "item_image", :force => true do |t|
    t.integer "item_id",                     :null => false
    t.string  "image",                       :null => false
    t.boolean "is_cover", :default => false, :null => false
  end

  add_index "item_image", ["item_id", "image"], :name => "UK_item_id_image", :unique => true
  add_index "item_image", ["item_id"], :name => "IDX_item_id"

  create_table "item_menu", :force => true do |t|
    t.integer "branch_id", :null => false
    t.integer "shop_id",   :null => false
    t.string  "name",      :null => false
    t.integer "index",     :null => false
  end

  add_index "item_menu", ["branch_id"], :name => "item_menu_ibfk_1"
  add_index "item_menu", ["shop_id"], :name => "item_menu_ibfk_2"

  create_table "manager", :force => true do |t|
    t.string   "email",                   :null => false
    t.string   "password",                :null => false
    t.string   "status",     :limit => 7, :null => false
    t.string   "name"
    t.string   "phone"
    t.string   "yahoo"
    t.string   "skype"
    t.datetime "reset_time"
  end

  add_index "manager", ["email"], :name => "UK__email_shop_id", :unique => true

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "page", :id => false, :force => true do |t|
    t.string  "key",       :limit => 7,   :null => false
    t.integer "branch_id",                :null => false
    t.integer "shop_id",                  :null => false
    t.string  "name"
    t.string  "desc",      :limit => 170
    t.text    "config"
    t.string  "status",    :limit => 7,   :null => false
  end

  add_index "page", ["branch_id"], :name => "page_ibfk_1"
  add_index "page", ["shop_id"], :name => "UK_shop_id__key"

  create_table "page_has_widget", :id => false, :force => true do |t|
    t.integer "shop_id",                    :null => false
    t.string  "page_key",     :limit => 7,  :null => false
    t.string  "widget_class",               :null => false
    t.text    "config"
    t.string  "position",     :limit => 13, :null => false
    t.integer "index",                      :null => false
  end

  add_index "page_has_widget", ["shop_id", "page_key", "position"], :name => "IDX_shop_id__key__position"
  add_index "page_has_widget", ["shop_id", "page_key", "widget_class", "position"], :name => "IDX_shop_id__key__widget_id__position"
  add_index "page_has_widget", ["widget_class"], :name => "FK_page_widget__widget_id"

  create_table "param", :force => true do |t|
    t.string  "name",       :null => false
    t.string  "name_2"
    t.string  "alias",      :null => false
    t.integer "parent_id"
    t.integer "group_id",   :null => false
    t.integer "index",      :null => false
    t.string  "foody_name"
  end

  add_index "param", ["alias"], :name => "alias", :unique => true
  add_index "param", ["group_id"], :name => "group_id"
  add_index "param", ["parent_id"], :name => "parent_id"

  create_table "param_group", :force => true do |t|
    t.string  "name",  :null => false
    t.integer "index", :null => false
  end

  create_table "post", :force => true do |t|
    t.string   "title",                       :null => false
    t.string   "desc",         :limit => 500, :null => false
    t.text     "content",                     :null => false
    t.string   "image",                       :null => false
    t.integer  "city_id"
    t.integer  "topic_id",                    :null => false
    t.datetime "created",                     :null => false
    t.integer  "viewed",                      :null => false
    t.integer  "viewed_week",                 :null => false
    t.integer  "viewed_month",                :null => false
    t.integer  "manager_id",                  :null => false
    t.string   "type",         :limit => 9,   :null => false
    t.string   "status",       :limit => 7,   :null => false
  end

  add_index "post", ["city_id"], :name => "city_id"
  add_index "post", ["manager_id"], :name => "manager_id"
  add_index "post", ["topic_id"], :name => "topic_id"

  create_table "post_cat", :force => true do |t|
    t.string  "name",               :null => false
    t.string  "alias",              :null => false
    t.string  "type",  :limit => 4
    t.integer "index",              :null => false
  end

  add_index "post_cat", ["alias"], :name => "alias_uk", :unique => true

  create_table "public_location", :force => true do |t|
    t.string  "name",                   :null => false
    t.string  "alias",                  :null => false
    t.integer "city_id",                :null => false
    t.string  "latlng",  :limit => 100, :null => false
    t.string  "status",  :limit => 7,   :null => false
  end

  add_index "public_location", ["city_id", "alias"], :name => "city_id_alias", :unique => true
  add_index "public_location", ["city_id"], :name => "city_id"

  create_table "shop", :force => true do |t|
    t.string  "name",                   :null => false
    t.string  "sub",      :limit => 50
    t.string  "domain",   :limit => 50
    t.string  "website"
    t.string  "email",    :limit => 50
    t.string  "theme",    :limit => 50
    t.string  "layout",   :limit => 13
    t.string  "status",   :limit => 7,  :null => false
    t.integer "foody_id"
    t.text    "config"
  end

  add_index "shop", ["domain"], :name => "UK_domain", :unique => true
  add_index "shop", ["foody_id"], :name => "foody_id", :unique => true
  add_index "shop", ["status"], :name => "ID_status"
  add_index "shop", ["sub"], :name => "UK_alias", :unique => true
  add_index "shop", ["theme"], :name => "FK_shop__theme_id"

  create_table "shop_menu", :force => true do |t|
    t.integer "shop_id",                :null => false
    t.string  "name",                   :null => false
    t.string  "desc",    :limit => 500
    t.boolean "is_main",                :null => false
  end

  add_index "shop_menu", ["shop_id"], :name => "shop_id"

  create_table "shop_menu_link", :force => true do |t|
    t.integer "shop_id",                                    :null => false
    t.integer "menu_id",                                    :null => false
    t.string  "name",                                       :null => false
    t.string  "link",                                       :null => false
    t.string  "desc",      :limit => 500
    t.string  "type",      :limit => 6,                     :null => false
    t.integer "parent_id"
    t.integer "index",                                      :null => false
    t.boolean "enable",                   :default => true, :null => false
    t.string  "target",    :limit => 6,                     :null => false
  end

  add_index "shop_menu_link", ["menu_id"], :name => "menu_id"
  add_index "shop_menu_link", ["parent_id"], :name => "menu_link_ibfk_3"
  add_index "shop_menu_link", ["shop_id"], :name => "shop_id"

  create_table "theme", :force => true do |t|
    t.string "name",                :null => false
    t.string "theme", :limit => 50, :null => false
  end

  add_index "theme", ["theme"], :name => "theme_uk", :unique => true

  create_table "user", :force => true do |t|
    t.string   "openid_id"
    t.string   "openid_service", :limit => 8
    t.string   "username"
    t.string   "email",          :limit => 60,                    :null => false
    t.string   "password"
    t.string   "name",           :limit => 160
    t.date     "dob"
    t.string   "gender",         :limit => 6
    t.string   "website"
    t.string   "image"
    t.datetime "created",                                         :null => false
    t.integer  "shop_id"
    t.string   "phone",          :limit => 20
    t.string   "address",        :limit => 50
    t.integer  "city_id"
    t.integer  "district_id"
    t.boolean  "enable",                        :default => true, :null => false
  end

  add_index "user", ["city_id"], :name => "FK_customer__city_id"
  add_index "user", ["district_id"], :name => "FK_customer__district_id"
  add_index "user", ["shop_id", "email"], :name => "UK_shop_id__openid_email", :unique => true
  add_index "user", ["shop_id", "openid_id"], :name => "email", :unique => true
  add_index "user", ["shop_id", "phone"], :name => "UK_shop_id__phone", :unique => true
  add_index "user", ["shop_id"], :name => "FK_user__shop_id"

  create_table "user_bookmark_post", :id => false, :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "handbook_id", :null => false
    t.datetime "created",     :null => false
  end

  add_index "user_bookmark_post", ["created"], :name => "idx_created"
  add_index "user_bookmark_post", ["handbook_id"], :name => "handbook_id"

  create_table "user_favourite_branch", :id => false, :force => true do |t|
    t.integer "user_id",   :null => false
    t.integer "branch_id", :null => false
    t.integer "shop_id",   :null => false
  end

  add_index "user_favourite_branch", ["branch_id"], :name => "branch_id"
  add_index "user_favourite_branch", ["shop_id"], :name => "shop_id"

  create_table "user_favourite_item", :id => false, :force => true do |t|
    t.integer "customer_id", :null => false
    t.integer "item_id",     :null => false
    t.integer "shop_id",     :null => false
  end

  add_index "user_favourite_item", ["item_id"], :name => "item_id"

  create_table "user_vote_comment", :id => false, :force => true do |t|
    t.integer  "user_id",                                     :null => false
    t.integer  "comment_id",                                  :null => false
    t.string   "vote",       :limit => 7, :default => "LIKE", :null => false
    t.datetime "created",                                     :null => false
  end

  add_index "user_vote_comment", ["comment_id"], :name => "comment_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "avatar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "widget", :force => true do |t|
    t.string "name",   :null => false
    t.string "class",  :null => false
    t.string "desc"
    t.text   "config"
  end

  add_index "widget", ["class"], :name => "UK_class", :unique => true

end
