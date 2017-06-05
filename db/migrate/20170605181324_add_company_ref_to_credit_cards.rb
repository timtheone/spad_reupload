class AddCompanyRefToCreditCards < ActiveRecord::Migration[5.0]
  def change
    add_reference :credit_cards, :company, foreign_key: true
  end
end
