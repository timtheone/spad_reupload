class UserPolicy < ApplicationPolicy

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      user.admin? ? scope.where(company_id: user.company_id) : scope.none
    end
  end
  def index
      user.admin
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

