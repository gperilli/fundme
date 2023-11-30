# frozen_string_literal: true

class PaymentCompleteMailTesterJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    # Do something later

    testDonation = Donation.create!(
      title: 'This is a test donation for testing the automated mailer',
      stripe_payment_id: 'pi_3LEwdfHeEx507c0I0FPm7fDW',
      status: 'succeeded',
      created_at: Time.now.to_s,
      updated_at: Time.now + 10.seconds,
      user_id: 24,
      donation_type: 'one_time',
      amount: 10,
      stripe_payment_method_id: nil,
      subscription_set_number: 0,
      subscription_status: nil
    )

    PaymentCompleteMailer.payment_complete(testDonation).deliver
  end
end
