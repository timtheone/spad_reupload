class Company < ApplicationRecord
  has_many :users
  has_many :credit_cards
  has_many :expenses, through: :users
end
