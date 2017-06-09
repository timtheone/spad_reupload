class RemoveRecipientFromExpense < ActiveRecord::Migration[5.0]
  def change
    remove_column :expenses, :recipient, :string
  end
end
