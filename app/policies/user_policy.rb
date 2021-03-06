class UserPolicy < ApplicationPolicy

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      user.admin? ? scope.where(company_id: user.company_id) : scope.none
      # scope.where(company_id: user.company_id)
    end
  end
  def index
    user.admin
  end

  def admin_destroy_user?
    user.admin && (record.company == user.company)
  end


  def reinvite?
    user.admin
  end

  def destroy?
    user.admin
  end

  def show?
   true
   # user == record.user  || user.admin
  end

  def edit?
   true
   # user == record.user || user.admin
  end

  def update?
       true
       #  user == current_user || user.admin
  end



end

