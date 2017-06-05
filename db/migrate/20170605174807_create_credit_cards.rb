class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.string :type
      t.date :exp_date
      t.integer :billing_day
      t.string :status
      t.date :closed_date

      t.timestamps
    end
  end
end
