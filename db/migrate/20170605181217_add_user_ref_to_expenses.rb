class AddUserRefToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_reference :expenses, :category, foreign_key: true
    add_reference :expenses, :credit_card, foreign_key: true
  end
end
