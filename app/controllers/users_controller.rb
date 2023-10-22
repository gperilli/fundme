# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
  end

  def update
    current_user.update_attribute('language', user_params[:language])
  end

  def cancel_subscription
    CancelSubscriptionJob.perform_now(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:user_id, :language)
  end
end
