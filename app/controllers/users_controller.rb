class UsersController < ApplicationController


  def index
      @users = policy_scope(User).order(created_at: :desc)
      @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.company_id = current_user.company_id
    @user.save
    redirect_to users_path
  end

private

  def user_params
    params.require(:user).permit(:email)
  end


end
