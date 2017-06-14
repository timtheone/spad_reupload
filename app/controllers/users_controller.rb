class UsersController < ApplicationController


  def index
      @users = policy_scope(User).order(created_at: :desc)
      @user = User.new
  end

def show
  set_user
  @company = Company.find(@user.company_id)
  authorize @user
end
  # def create
  #   @user = User.new(user_params)
  #   @user.company_id = current_user.company_id
  #   @user.save
  #   redirect_to users_path
  # end

  def reinvite
    @user = User.find(params[:id])
    @user.deleted_at = nil
    @user.status = 'invited'
    @user.invite!(current_user)
    redirect_to users_path
    authorize @user
  end

  def edit
    set_user
    authorize @user

  end

  def update
    set_user
    @user.save
    @user.update(user_params)
    redirect_to user_path(@user)
    authorize @user
  end


  # def destroy
  #   set_user
  #   @user.destroy
  #   redirect_to users_path
  #   authorize @user
  # end

  def set_user
     @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:email, :id, :first_name, :last_name, :portrait, :portrait_cache)
  end

end



