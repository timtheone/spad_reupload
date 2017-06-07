class AddCompanyRefToCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :company, foreign_key: true
  end
end
