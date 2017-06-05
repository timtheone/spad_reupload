class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.references :user, foreign_key: true
      t.date :date
      t.integer :amount
      t.integer :cycle

      t.timestamps
    end
  end
end
