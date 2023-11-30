# frozen_string_literal: true

ActiveAdmin.register Donation do
  menu priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :price, :stripe_payment_id, :status, :user_id, :donation_type, :amount, :stripe_payment_method_id, :subscription_set_number, :subscription_status
  #

  scope :all
  scope :monthly_donations
  scope :yearly_donations
  scope :one_off_donations
  # or
  #
  # permit_params do
  #   permitted = [:title, :price, :stripe_payment_id, :status, :user_id, :donation_type, :amount, :stripe_payment_method_id, :subscription_set_number, :subscription_status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    column :title
    column :user
    column :stripe_payment_id
    column :status
    column :donation_type
    column :amount do |d|
      number_to_currency d.amount
    end
    column :stripe_payment_method_id
    column :subscription_set_number
    column :subscription_status
  end
end
