class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :credit_card
  belongs_to :category
  belongs_to :company

  validate :date_cannot_be_in_the_future

  def date_cannot_be_in_the_future
    if date > Date.today
      errors.add(:date, "can't be in the future")
    end
  end

  # Expense.for_credit_card_by_cycle(args)
  scope :for_credit_card_by_cycle, -> (credit_card_id, cycle, year) do
    credit_card = CreditCard.find(credit_card_id)
    if (cycle > 1) && (cycle <= 12)
      cycle_beginning_date = Date.new(year, cycle - 1, credit_card.billing_day)
      cycle_end_date = Date.new(year, cycle, credit_card.billing_day - 1)
      cycle_time_range = cycle_beginning_date..cycle_end_date
    elsif cycle = 1
      cycle_beginning_date = Date.new(year - 1, cycle = 12, credit_card.billing_day)
      cycle_end_date = Date.new(year, cycle = 1, credit_card.billing_day - 1)
      cycle_time_range = cycle_beginning_date..cycle_end_date
    end

    where(date: cycle_time_range)
  end

  mount_uploader :recipient, RecipientUploader

  monetize :amount_cents
end
