class ExpensesController < ApplicationController
  def index
    card_id = current_user.company.credit_cards.where(status: "Active").first
    if card_id.nil?
      redirect_to credit_cards_path
      flash[:alert] = "At least one card must be active"
      authorize policy_scope(CreditCard)
    else
      card_id = current_user.company.credit_cards.where(status: "Active").first.id
      if params[:year]
        @selected_year = params[:year].to_i
        @selected_month = params[:month].to_i

        if params[:scope] == "company"
          @expenses = policy_scope(Expense).for_credit_card_by_cycle(card_id, @selected_month, @selected_year)
          @total_expense = Money.new(@expenses.sum(:amount_cents), 'EUR')
        else
          @expenses = policy_scope(Expense).for_credit_card_by_cycle(card_id, @selected_month, @selected_year)
                                           .where(user: current_user)
          @total_expense = Money.new(@expenses.sum(:amount_cents), 'EUR')
        end

      elsif params[:all]
        @selected_month = Date.today.month
        @selected_year = Date.today.year
        @expenses = policy_scope(Expense)

        if params[:scope] == "company"
          @expenses = policy_scope(Expense)
          @total_expense = Money.new(@expenses.sum(:amount_cents), 'EUR')
        else
          @expenses = policy_scope(Expense).where(user: current_user)
          @total_expense = Money.new(@expenses.sum(:amount_cents), 'EUR')
        end

      else
        @selected_month = Date.today.month
        @selected_year = Date.today.year
        if params[:scope] == "company"
          @expenses = policy_scope(Expense).for_credit_card_by_cycle(card_id, @selected_month, @selected_year)
          @total_expense = Money.new(@expenses.sum(:amount_cents), 'EUR')
        else
          @expenses = policy_scope(Expense).for_credit_card_by_cycle(card_id, @selected_month, @selected_year)
                                           .where(user: current_user)
          @total_expense = Money.new(@expenses.sum(:amount_cents), 'EUR')
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

      respond_to do |format|
        format.html
        format.pdf do
          render template: "expenses/report",
          pdf: 'report'   # Excluding ".pdf" extension.
        end
      end
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
      flash[:alert] = "Wrong date or no receipt has been uploaded"
      redirect_to expenses_path
    end
  end

  # def show
  #   @expense = Expense.find(params[:id])
  #   respond_to do |format|
  #     format.html
  #     format.pdf do
  #       render template: "expenses/report",
  #       pdf: 'report'   # Excluding ".pdf" extension.
  #     end
  #   end
  #   authorize @expense
  # end

  private

  def expense_params
    params.require(:expense).permit(:date, :amount, :category_id, :receipt, :receipt_cache, :details)
  end
end

