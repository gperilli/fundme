class UsersController < ApplicationController
    def show
        @user = current_user
        #@sitewide_text_items = SitewideTextItem.all
        #
        #authorize @user
    end

    def update
        current_user.update_attribute('language', user_params[:language])
    end

    def cancel_subscription
        puts "CANCELLING"
        CancelSubscriptionJob.perform_now(current_user)
    end

    private
    def user_params
        params.require(:user).permit(:user_id, :language)
    end
end
