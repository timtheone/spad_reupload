class Category < ApplicationRecord
  has_many :expenses
  belongs_to :company
end
