class ExpensePolicy < ApplicationPolicy
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
    true
  end

  def previous_cycle?
    true
  end
end
