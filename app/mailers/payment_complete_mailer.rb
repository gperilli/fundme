# frozen_string_literal: true

class PaymentCompleteMailer < ApplicationMailer
  default from: Rails.application.config.mailer_address
  def payment_complete(donation)
    @donation = donation
    mail(to: donation.user.email, subject: 'Donation Payment Received')
  end
end
