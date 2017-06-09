class RemoveRecieptFromExpense < ActiveRecord::Migration[5.0]
  def change
    remove_column :expenses, :reciept, :string
  end
end
