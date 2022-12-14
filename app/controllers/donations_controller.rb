class DonationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    if params[:sub_amount] == "20" && current_user.subscribed == false
      @sub_amount = params[:sub_amount].to_i
      @sub_frequency = "monthly"
    elsif  params[:sub_amount] == "200" && current_user.subscribed == false
      @sub_amount = params[:sub_amount].to_i
      @sub_frequency = "yearly"
    else
      @sub_amount = 0
    end
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def create

    if form_params[:donation_type] == "subscription" && current_user.subscribed == false
      # Subscribing User
      current_user.update_attribute(:subscribed, true)
      current_user.update_attribute(:subscription_stage, 1)
      current_user.update_attribute(:subscription_frequency, form_params[:subscription_frequency])
      current_user.subscriptions << Subscription.new(
        status: "active",
      )

      @donation = Donation.new(
        title: form_params[:title],
        stripe_payment_id: form_params[:stripe_payment_id],
        donation_type: form_params[:donation_type],
        amount: form_params[:amount],
        stripe_payment_method_id: Stripe::PaymentIntent.retrieve(form_params[:stripe_payment_id])[:payment_method],
        subscription_set_number: current_user.subscription_stage,
        user_id: current_user.id,
        subscription_id: "#{current_user.subscriptions.last.id}"
      )
      @donation.update_attribute(:subscription_status, "active")
    else
      @donation = Donation.new(
        title: form_params[:title],
        stripe_payment_id: form_params[:stripe_payment_id],
        donation_type: form_params[:donation_type],
        amount: form_params[:amount],
        user_id: current_user.id,
        )
    end

    @donation.update_attribute(:status, "processing")
    if @donation.save
      @donation.update_attribute(:status, Stripe::PaymentIntent.retrieve(@donation.stripe_payment_id)[:status])
      total_donations = @donation.user.total_donations
      total_donations += @donation.amount
      @donation.user.update_attribute(:total_donations, total_donations)
      redirect_to @donation
    else
      flash.now[:error] = "Oops, something went wrong with your submission. Please try again!"
      render :new
    end


  end


  private
  def form_params
    params.require(:donation).permit(
      :title,
      :stripe_payment_id,
      :donation_type,
      :amount,
      :subscription_frequency
    )
  end

end
