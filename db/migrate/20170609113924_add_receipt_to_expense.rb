class AddReceiptToExpense < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :receipt, :string
  end
end
