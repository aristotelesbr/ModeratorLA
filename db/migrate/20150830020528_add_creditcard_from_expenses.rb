class AddCreditcardFromExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :creditcard, :string
  end
end
