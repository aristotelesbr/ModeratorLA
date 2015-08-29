class AddCardFromExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :card, :string
  end
end
