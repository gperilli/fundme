# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:username, :first_name, :last_name, :other_names, :email, :password,
                                 :password_confirmation)
  end
end
