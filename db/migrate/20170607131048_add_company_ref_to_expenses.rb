class AddCompanyRefToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_reference :expenses, :company, foreign_key: true
  end
end
