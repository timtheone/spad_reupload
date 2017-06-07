class CreditCardsController < ApplicationController

  # def admin_list
  #   authorize CreditCard
  # end

  def index
    @credit_cards = policy_scope(CreditCard).order("
      CASE
        WHEN status = 'Active' THEN '1'
        WHEN status = 'Not active' THEN '2'
        WHEN status = 'Closed' THEN '3'
      END
    ")

  end

  def new
      @credit_card = CreditCard.new
      authorize @credit_card
  end

  def create
      @credit_card = CreditCard.new(credit_card_params)
      @credit_card.company = current_user.company
      if @credit_card.save!
        flash[:notice] = "Credit card has been successfully added"
        redirect_to credit_cards_path
      else
        flash[:alert] = "Something went wrong"
        render :new
      end
      authorize @credit_card
  end

  def edit
    @credit_card = CreditCard.find(params[:id])
    authorize @credit_card
    if @credit_card.status != "Closed"
    else
    redirect_to credit_cards_path
    end
  end

  def update
    @credit_card = CreditCard.find(params[:id])
    authorize @credit_card
    @credit_card.update(credit_card_params)
    redirect_to credit_cards_path
  end

  def activate
    @credit_card = CreditCard.find(params[:id])
    authorize @credit_card
    if (current_user.company.credit_cards.where(status: "Active")).count == 0
      @credit_card.update(status: "Active")
      flash[:notice] = "Credit card has been activated"
      redirect_to credit_cards_path
    else
      flash[:alert] = "Only one credit card can be active at the same time"
      redirect_to credit_cards_path
    end
  end

   def deactivate
    @credit_card = CreditCard.find(params[:id])
    authorize @credit_card
    @credit_card.update(status: "Not active")
    flash[:alert] = "Credit card has been deactivated"
    redirect_to credit_cards_path
  end

  def close
    @credit_card = CreditCard.find(params[:id])
    authorize @credit_card
    @credit_card.update(status: "Closed")
    if @credit_card.save
      flash[:notice] = "Credit card has been closed"
      redirect_to credit_cards_path
    else
      flash[:alert] = "Something went wrong"
      redirect_to credit_cards_path
    end
  end

  private

  def credit_card_params
    params.require(:credit_card).permit(:number, :credit_card_type, :exp_date, :billing_day, :status)
  end
end
