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

ActiveRecord::Schema.define(:version => 20180709132758) do

  create_table "bookings", :force => true do |t|
    t.integer  "customerId"
    t.integer  "vendorId"
    t.datetime "bookingTime"
    t.integer  "otp"
    t.string   "brandName"
    t.integer  "brandId"
    t.integer  "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "brandlists", :force => true do |t|
    t.string   "brandName"
    t.integer  "quantity"
    t.integer  "Price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.text     "address"
    t.integer  "ward"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vendors_wards", :force => true do |t|
    t.integer  "vendor_id"
    t.integer  "ward"
    t.integer  "numberOfOrders"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
