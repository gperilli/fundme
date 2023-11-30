# frozen_string_literal: true

ActiveAdmin.register User do
  menu priority: 1
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :user_name, :user_number, :uid, :subscribed, :stripe_customer_id, :stripe_payment_method_id, :subscription_stage, :subscription_frequency, :username, :language
  permit_params :email, :user_number, :uid, :subscribed, :stripe_customer_id, :stripe_payment_method_id,
                :subscription_stage, :subscription_frequency, :username, :language

  scope :all
  scope :subscribed
  scope :not_subscribed
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :user_name, :user_number, :uid, :subscribed, :stripe_customer_id, :stripe_payment_method_id, :subscription_stage, :subscription_frequency, :username, :language]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :username
    column :email
    column :first_name
    column :last_name
    column :other_names
    column :language
    column :uid
    # column :total_donations
    column :total_donations do |d|
      number_to_currency d.total_donations
    end
    column :subscribed
    column :subscription_frequency
    column :subscription_stage
    column :stripe_customer_id
    column :stripe_payment_method_id
  end
end
