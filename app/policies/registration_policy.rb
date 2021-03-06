class RegistrationPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end
    def resolve
      # user.admin? ? scope.where(company_id: user.company_id) : scope.none
      scope.where(company_id: user.company_id)
    end

  end

  def admin_destroy_user?
    user.admin
  end


end
