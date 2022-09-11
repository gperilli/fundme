class PaymentCompleteMailer < ApplicationMailer
    default from: Rails.application.config.mailer_address
    def payment_complete(donation)
      @donation = donation
      puts "************************"
      puts ""
      puts donation
      puts "Email #{donation.user.email}"
      puts ""
      puts "************************"
      mail(to: donation.user.email, subject: "Donation Payment Received")
    end
end
