module ExpensesHelper
  def sum_expenses
    @expenses.sum(:value)
  end
end
