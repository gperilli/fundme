class PagesController < ApplicationController
    #skip_before_action :authenticate_user!, only: :home

  def home
    @dd_home_page = Ddpage.find_by title: "home"
    if TextBlock.all.present?
      @dd_home_page_text_blocks = @dd_home_page.text_blocks.all.order(:order)
    end
  end

  def send_contact
    puts "BANG"
    ContactMailer.contact(params).deliver
  end

end
