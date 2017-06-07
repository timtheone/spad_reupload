class Company < ApplicationRecord
  has_many :users
  has_many :credit_cards
  has_many :categories
  has_many :expenses
end
