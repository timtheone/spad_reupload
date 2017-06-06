class CreditCardsController < ApplicationController
  def index
    @credit_cards = current_user.company.credit_cards.order("
    CASE
      WHEN status = 'Active' THEN '1'
      WHEN status = 'Not active' THEN '2'
      WHEN status = 'Closed' THEN '3'
    END")
  end

  def new
    if current_user.admin && user_signed_in?
      @credit_card = CreditCard.new
    else
      redirect_to credit_cards_path
    end
  end

  def create
    if current_user.admin && user_signed_in?
      @credit_card = CreditCard.new(credit_card_params)
      @credit_card.company = current_user.company
      if @credit_card.save!
        flash[:notice] = "Credit card has been successfully added"
        redirect_to credit_cards_path
      else
        flash[:alert] = "Something went wrong"
        render :new
      end
    else
      flash[:alert] = "You are not authorized to do that"
      redirect_to credit_cards_path
    end
  end

  def activate
    @credit_card = CreditCard.find(params[:id])
    if (current_user.company.credit_cards.where(status: "Active")).count == 0
      @credit_card.update(status: "Active")
      if @credit_card.save
        flash[:notice] = "Credit card has been activated"
        redirect_to credit_cards_path
      else
        flash[:alert] = "Only one credit card can be active at the same time"
        redirect_to credit_cards_path
      end
    else
      flash[:alert] = "Only one credit card can be active at the same time"
      redirect_to credit_cards_path
    end
  end

   def deactivate
    @credit_card = CreditCard.find(params[:id])
    @credit_card.update(status: "Not active")
    if @credit_card.save
      flash[:alert] = "Credit card has been deactivated"
      redirect_to credit_cards_path
    else
      flash[:alert] = "Something went wrong"
      render credit_cards_path
    end
  end

  def close
    @credit_card = CreditCard.find(params[:id])
    @credit_card.update(status: "Closed")
    if @credit_card.save
      flash[:notice] = "Credit card has been closed"
      redirect_to credit_cards_path
    else
      flash[:alert] = "Something went wrong"
      render credit_cards_path
    end
  end

  private

  def credit_card_params
    params.require(:credit_card).permit(:number, :credit_card_type, :exp_date, :billing_day, :status)
  end
end
