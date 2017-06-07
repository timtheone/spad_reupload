class Users::InvitationsController < Devise::InvitationsController

  def after_invite_path_for(resource)
    users_path
  end

  private

   def invite_params
    params.require(:user).permit(:name, :email, :invitation_token, :company_id, :status)
   end

end
