class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def after_sign_in_path_for(resource)
    expenses_path
  end

  def after_sign_in_path_for(resource)
  # count the number of users in the same company
  # if just one user, to invite
  # other wise, ot
  # resource.company_id
  nb_users = User.where(company_id: resource.company_id).count
  if (nb_users < 2 && current_user.admin?)
    then
    return users_path
  else
    return expenses_path
  end

end


private

def skip_pundit?
  devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
end

def user_not_authorized
  flash[:alert] = "You are not authorized to perform this action."
  redirect_to(request.referrer || root_path)
end
end
