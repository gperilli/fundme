# frozen_string_literal: true

class DonationsController < ApplicationController
  before_action :authenticate_user!

  def new
    if params[:donation_type] == "monthly_subscription" && current_user.subscribed == false
      @sub_amount = SubscriptionParameter.find_by(active: true).monthly_subscription_amount
      @sub_frequency = 'monthly'
    elsif params[:donation_type] == "yearly_subscription" && current_user.subscribed == false
      @sub_amount = SubscriptionParameter.find_by(active: true).yearly_subscription_amount
      @sub_frequency = 'yearly'
    else
      @sub_amount = 0
    end
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def create
    if (form_params[:donation_type] == 'monthly_subscription' || form_params[:donation_type] == 'yearly_subscription') && current_user.subscribed == false
      current_user.update_attribute(:subscribed, true)
      current_user.update_attribute(:subscription_stage, 1)
      current_user.update_attribute(:subscription_frequency, form_params[:subscription_frequency])
      current_user.subscriptions << Subscription.new(
        status: 'active'
      )

      @donation = Donation.new(
        title: form_params[:title],
        stripe_payment_id: form_params[:stripe_payment_id],
        donation_type: "#{form_params[:subscription_frequency]}_subscription",
        amount: form_params[:amount],
        stripe_payment_method_id: Stripe::PaymentIntent.retrieve(form_params[:stripe_payment_id])[:payment_method],
        subscription_set_number: current_user.subscription_stage,
        user_id: current_user.id,
        subscription_id: current_user.subscriptions.last.id.to_s
      )
      @donation.update_attribute(:subscription_status, 'active')
    else
      @donation = Donation.new(
        title: form_params[:title],
        stripe_payment_id: form_params[:stripe_payment_id],
        donation_type: form_params[:donation_type],
        amount: form_params[:amount],
        user_id: current_user.id
      )
    end

    @donation.update_attribute(:status, 'processing')
    if @donation.save
      @donation.update_attribute(:status, Stripe::PaymentIntent.retrieve(@donation.stripe_payment_id)[:status])
      total_donations = @donation.user.total_donations
      total_donations += @donation.amount
      @donation.user.update_attribute(:total_donations, total_donations)
      redirect_to @donation
    else
      flash.now[:error] = 'Oops, something went wrong with your submission. Please try again!'
      render :new
    end
  end

  private

  def form_params
    params.require(:donation).permit(
      :title,
      :stripe_payment_id,
      :donation_type,
      :amount
    )
  end
end
