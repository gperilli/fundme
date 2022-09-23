class ContactMailer < ApplicationMailer
    default from: Rails.application.config.mailer_address
    def contact(message_form)
      @message_form = message_form
      puts "************************"
      puts ""
      puts @message_form
      puts "Email #{@message_form[:email]}, Name: #{@message_form[:name]}, Subject: #{@message_form[:subject]}, Message: #{@message_form[:message]},"
      puts ""
      puts "************************"
      mail(to: ["gareth@gperilli.dev"], subject: @message_form[:subject])
      puts "BANG"
    end
  end