class RegistrationsController < Devise::RegistrationsController

    #def new
    #  @sitewide_text_items = SitewideTextItem.all
    #end

    private
  
    def sign_up_params
      params.require(:user).permit(:username, :first_name, :last_name, :other_names, :email, :password, :password_confirmation)
      
    end
  
    #def account_update_params
    #  params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    #end
  end