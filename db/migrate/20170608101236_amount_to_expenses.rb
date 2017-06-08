class AmountToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_monetize :expenses, :amount, currency: { present: false }
  end
end
