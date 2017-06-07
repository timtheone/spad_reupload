class ExpensesController < ApplicationController
  def index
    card_id = current_user.company.credit_cards.where(status: "Active").first.id
    @expenses = policy_scope(Expense).for_credit_card_by_cycle(card_id,Date.today.month,Date.today.year)
  end
end

