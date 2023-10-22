# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  default from: Rails.application.config.mailer_address
  def contact(message_form)
    @message_form = message_form
    mail(to: ['gareth@gperilli.dev'], subject: @message_form[:subject])
  end
end
