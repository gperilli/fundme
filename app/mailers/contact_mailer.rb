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
      mail(to: ["garethperilli@gmail.com", "jcg115@gmail.com", "jgerardi618@gmail.com"], subject: @message_form[:subject]) if @message_form[:name] != "CrytoAwapy"
    end
  end