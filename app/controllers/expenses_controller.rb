class ExpensesController < ApplicationController
  def index
    card_id = current_user.company.credit_cards.where(status: "Active").first.id

    if params[:year]
      @selected_year = params[:year].to_i
      @selected_month = params[:month].to_i

      if params[:scope] == "company"
        @expenses = policy_scope(Expense).for_credit_card_by_cycle(card_id, @selected_month, @selected_year)
      else
        @expenses = policy_scope(Expense).for_credit_card_by_cycle(card_id, @selected_month, @selected_year)
                                         .where(user: current_user)
      end

    elsif params[:all]
      @selected_month = Date.today.month
      @selected_year = Date.today.year
      @expenses = policy_scope(Expense)

      if params[:scope] == "company"
        @expenses = policy_scope(Expense)
      else
        @expenses = policy_scope(Expense).where(user: current_user)
      end

    else
      @selected_month = Date.today.month
      @selected_year = Date.today.year
      if params[:scope] == "company"
        @expenses = policy_scope(Expense).for_credit_card_by_cycle(card_id, @selected_month, @selected_year)
      else
        @expenses = policy_scope(Expense).for_credit_card_by_cycle(card_id, @selected_month, @selected_year)
                                         .where(user: current_user)
      end
    end
    @expense = Expense.new

    if @selected_month < 12
      @next_month  = @selected_month + 1
      @next_year = @selected_year
    else
      @next_month = 1
      @next_year = @selected_year + 1
    end

    if @selected_month > 1
      @previous_month = @selected_month - 1
      @previous_year = @selected_year
    else
      @previous_month = 12
      @previous_year = @selected_year - 1
    end
  end

  def create
    @credit_card = current_user.company.credit_cards.find_by(status: "Active")
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    @expense.credit_card = @credit_card
    @expense.company = current_user.company
    authorize @expense
    if @expense.save
      redirect_to expenses_path
    else
      flash[:alert] = "Wrong date or no recipient has been uploaded"
      redirect_to expenses_path
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:date, :amount, :category_id, :recipient, :recipient_cache)
  end
end

