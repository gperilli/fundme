# frozen_string_literal: true

class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    @fm_home_page = Fmpage.find_by title: 'home'
    return unless TextBlock.all.present?

    @fm_home_page_text_blocks = @fm_home_page.text_blocks.all.order(:order)
  end

  def send_contact
    ContactMailer.contact(params).deliver
  end
end
