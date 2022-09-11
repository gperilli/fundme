class DdpagesController < ApplicationController
    def show
        # get page id or title from url params
        @dd_page = Ddpage.find_by id: params[:id] if params[:id].is_a? Integer
        @dd_page = Ddpage.find_by title: params[:id].gsub(/_/, " ") if params[:id].is_a? String
        
        if @dd_page.nil? 
            # Send to 404
            raise ActionController::RoutingError.new('Not Found')
        else
            redirect_to root_path if !@dd_page.is_published?
            @dd_page_text_blocks = @dd_page.text_blocks.all.order(:order)
            #@sitewide_text_items = SitewideTextItem.all
        end

        
    end
end