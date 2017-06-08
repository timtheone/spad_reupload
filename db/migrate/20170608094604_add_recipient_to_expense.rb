class AddRecipientToExpense < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :recipient, :string
  end
end
