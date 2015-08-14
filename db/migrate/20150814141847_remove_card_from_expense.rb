class RemoveCardFromExpense < ActiveRecord::Migration
  def change
    remove_column :expenses, :card, :boolean
  end
end
