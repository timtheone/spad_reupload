class CreditCard < ApplicationRecord
  has_many :expenses
  belongs_to :company

  def last_digits
    number.to_s.length <= 4 ? number : number.to_s.slice(-4..-1)
  end

  def mask
    "XXXX-XXXX-XXXX-#{last_digits}"
  end
end
