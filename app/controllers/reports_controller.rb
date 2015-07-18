class ReportsController < ApplicationController
  def index
    @desp = Expense.desp
  end
end
