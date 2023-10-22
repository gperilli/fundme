# frozen_string_literal: true

class FmpagesController < ApplicationController
  def show
    # get page id or title from url params
    @fm_page = Fmpage.find_by id: params[:id] if params[:id].is_a? Integer
    @fm_page = Fmpage.find_by title: params[:id].gsub(/_/, ' ') if params[:id].is_a? String

    raise ActionController::RoutingError, 'Not Found' if @fm_page.nil?

    # Send to 404

    redirect_to root_path unless @fm_page.is_published?
    @fm_page_text_blocks = @fm_page.text_blocks.all.order(:order)
  end
end
