# frozen_string_literal: true

class PaymentIntentsController < ApplicationController
  def create
    # Create a payment intent with the expected amount,
    payment_params[:donation_type] == 'one_time' ? payment_type = 'one time donation' : payment_type = 'subscription donation'

    if current_user.stripe_customer_id.nil?
      stripe_customer = Stripe::Customer.create(
        email: current_user[:email]
      )
      current_user.update(stripe_customer_id: stripe_customer[:id])
    end

    payment_intent = if payment_params[:donation_type] == 'one_time'
                       # Payment Intent for single payment
                       Stripe::PaymentIntent.create(
                         customer: current_user.stripe_customer_id,
                         amount: payment_params[:amount].to_i * 100,
                         currency: 'usd',
                         description: "$#{payment_params[:amount]} #{payment_type}",
                         statement_descriptor: 'FundMe Donation'
                       )

                     else
                       Stripe::PaymentIntent.create(
                         customer: current_user.stripe_customer_id,
                         setup_future_usage: 'off_session',
                         amount: payment_params[:amount].to_i * 100,
                         currency: 'usd',
                         automatic_payment_methods: {
                           enabled: true
                         },
                         description: "$#{payment_params[:amount]} #{payment_type} - 1 of 12",
                         statement_descriptor: 'FundMe Donation'
                       )
                     end

    # return the client secret
    render json: {
      id: payment_intent.id,
      client_secret: payment_intent.client_secret
    }
  end

  private

  def payment_params
    params.require(:payment_intent).permit(:status, :amount, :donation_type)
  end
end
