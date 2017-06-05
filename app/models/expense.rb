class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :credit_cards
  belongs_to :category
end
