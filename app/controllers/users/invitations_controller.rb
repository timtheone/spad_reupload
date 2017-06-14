class Users::InvitationsController < Devise::InvitationsController

 before_filter :configure_permitted_parameters, if: :devise_controller?



  def after_invite_path_for(resource)
    users_path
  end


  def after_sign_up_path_for(resource)
    #super(resource)
    expenses_path
  end

  def after_sign_in_path_for(resource)
    #super(resource)
    expenses_path
  end


  private

   def invite_params
      params.require(:user).permit(:name, :email, :invitation_token, :company_id, :status, :first_name, :last_name, :status)
   end

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation) do |u|
      u.permit(:last_name, :first_name, :email, :password, :password_confirmation, :invitation_token, :status)
  end

end


end
