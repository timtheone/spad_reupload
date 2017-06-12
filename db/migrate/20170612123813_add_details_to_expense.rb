class AddDetailsToExpense < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :details, :text
  end
end
