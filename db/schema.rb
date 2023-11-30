# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_230_607_155_912) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'donations', force: :cascade do |t|
    t.string 'title'
    t.string 'stripe_payment_id'
    t.string 'status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id', null: false
    t.string 'donation_type'
    t.integer 'amount'
    t.string 'stripe_payment_method_id'
    t.integer 'subscription_set_number', default: 0
    t.string 'subscription_status'
    t.string 'subscription_id'
    t.index ['user_id'], name: 'index_donations_on_user_id'
  end

  create_table 'fmpages', force: :cascade do |t|
    t.string 'title'
    t.boolean 'is_published'
    t.string 'en'
    t.string 'es'
    t.string 'pt'
    t.string 'cr'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'sitewide_text_items', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.text 'en'
    t.text 'es'
    t.text 'pt'
  end

  create_table 'sitewide_texts', force: :cascade do |t|
    t.string 'name'
    t.text 'en'
    t.text 'es'
    t.text 'pt'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'subscription_parameters', force: :cascade do |t|
    t.integer 'monthly_subscription_term'
    t.integer 'monthly_subscription_amount'
    t.integer 'yearly_subscription_amount'
    t.boolean 'active'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'subscriptions', force: :cascade do |t|
    t.string 'status'
    t.string 'subscription_frequency'
    t.integer 'subscription_stage'
    t.integer 'monthly_subscription_term'
    t.integer 'monthly_subscription_amount'
    t.integer 'yearly_subscription_amount'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_subscriptions_on_user_id'
  end

  create_table 'text_blocks', force: :cascade do |t|
    t.string 'title'
    t.integer 'order'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.text 'en'
    t.text 'es'
    t.text 'pt'
    t.bigint 'fmpage_id', null: false
    t.index ['fmpage_id'], name: 'index_text_blocks_on_fmpage_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: ''
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'user_number'
    t.string 'uid'
    t.boolean 'subscribed', default: false
    t.string 'stripe_customer_id'
    t.string 'stripe_payment_method_id'
    t.integer 'subscription_stage', default: 0
    t.string 'subscription_frequency'
    t.string 'username'
    t.string 'language'
    t.integer 'total_donations', default: 0
    t.string 'first_name'
    t.string 'last_name'
    t.string 'other_names'
    t.index ['email'], name: 'index_users_on_email'
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['username'], name: 'index_users_on_username', unique: true
  end

  add_foreign_key 'donations', 'users'
  add_foreign_key 'subscriptions', 'users'
  add_foreign_key 'text_blocks', 'fmpages'
end
