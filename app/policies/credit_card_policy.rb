class CreditCardPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.where(company_id: user.company_id)
    end
  end

  def create?
    user.admin
  end

  def update?
    user.admin
  end

  def activate?
    user.admin
  end

  def deactivate?
    user.admin
  end

  def close?
    user.admin
  end
end
