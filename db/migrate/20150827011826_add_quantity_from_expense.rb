class AddQuantityFromExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :quantity, :integer
  end
end
