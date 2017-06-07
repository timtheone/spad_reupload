class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :credit_card
  belongs_to :category
  belongs_to :company

  # Expense.for_credit_card_by_cycle(args)
  scope :for_credit_card_by_cycle, -> (credit_card_id, cycle, year) do
    credit_card = CreditCard.find(credit_card_id)

    cycle_beginning_date = Date.new(year, cycle - 1, credit_card.billing_day)
    cycle_end_date = Date.new(year, cycle, credit_card.billing_day - 1)
    cycle_time_range = cycle_beginning_date..cycle_end_date

    where(date: cycle_time_range)
  end
end
