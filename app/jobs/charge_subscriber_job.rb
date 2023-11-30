# frozen_string_literal: true

class ChargeSubscriberJob < ApplicationJob
  queue_as :default

  def perform(*donation)
    # Do something later
    puts ''
    puts ''
    puts '###########################################'
    puts 'Auto Charging A Subscriber'
    donation = donation[0]
    puts donation
    puts "stripe_customer_id: #{donation.user.stripe_customer_id}"
    puts "stripe_payment_method_id: #{donation.stripe_payment_method_id}"
    puts '###########################################'
    puts ''
    puts ''

    this_subscription = Subscription.find_by!(id: donation.subscription_id) if donation.subscription_id.present?

    return unless donation.user.subscribed == true && this_subscription.status == 'active'

    begin
      intent = Stripe::PaymentIntent.create({
                                              amount: this_subscription.monthly_subscription_amount * 100,
                                              currency: 'usd',
                                              description: "$#{this_subscription.monthly_subscription_amount} subscription donation - #{donation.user.subscription_stage} of 12",
                                              statement_descriptor: 'FundMe Donation',
                                              customer: donation.user.stripe_customer_id,
                                              payment_method: donation.stripe_payment_method_id,
                                              off_session: true,
                                              confirm: true
                                            })
    rescue Stripe::CardError => e
      # Error code will be authentication_required if authentication is needed
      puts "Error is: \#{e.error.code}"
      payment_intent_id = e.error.payment_intent.id
      payment_intent = Stripe::PaymentIntent.retrieve(payment_intent_id)
      puts payment_intent.id
    end

    subscription_id = donation.subscription_id.present? ? donation.subscription_id : ''

    automated_donation = Donation.create!(
      title: "$#{this_subscription.monthly_subscription_amount} / month Donation",
      stripe_payment_id: intent.id,
      donation_type: 'automated',
      amount: this_subscription.monthly_subscription_amount,
      stripe_payment_method_id: Stripe::PaymentIntent.retrieve(donation.stripe_payment_id)[:payment_method],
      user_id: donation.user.id,
      subscription_set_number: donation.user.subscription_stage,
      status: 'suceeded',
      subscription_status: 'active',
      subscription_id: subscription_id.to_s
    )

    total_donations = automated_donation.user.total_donations
    total_donations += automated_donation.amount
    automated_donation.user.update_attribute(:total_donations, total_donations)
  end
end
