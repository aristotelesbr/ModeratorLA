class ExpensesController < ApplicationController
  before_action :find_expense, only: [:show, :edit, :update, :destroy]

  def index
    @expenses = Expense.all
    @total = Expense.total
    @total_card = Expense.total_card
    @income_current = Income.income_current
    @expense_current = Expense.expense_current
    @expense_current_month = Expense.expense_current_month.page(params['page']).per(2)
    @income_mont_ago = Income.income_mont_ago
    @expense_month_ago = Expense.expense_month_ago
    @difference_month_ago = @income_mont_ago - @expense_month_ago
    @difference_current = (@income_current - @expense_current) + @difference_month_ago
  end

  def search
    if params[:data1].present? && params[:data2].present?
      @expenses = Expense.where( created_at: params[:data1].to_date.beginning_of_day..params[:data2].to_date.end_of_day)
      respond_to :js
    else
      flash.now[:alert] = "Você precisa preenhcer ambas as datas né tio."
      @expenses = Expense.where( created_at: Date.today.beginning_of_month..Date.today.end_of_month)
    end
  end

  def new
    @expense = current_user.expenses.build
  end

  def show
  end

  def create
    @expense = current_user.expenses.build(expense_params)

    if @expense.save
      redirect_to @expense, notice: 'notice.expense.success'
    else
      redirect_to root_path, alert: 'Estorou o limite.'
    end
  end

  def edit
  end

  def update
    if @expense.update(expense_params)
      redirect_to @expense, notice: 'notice.expense.update'
    else
      render 'edit'
    end
  end

  def destroy
    @expense.destroy
      redirect_to root_path, alert: 'alert.expense.destroy'
  end

  private

  def expense_params
    params.require(:expense).permit(:value, :description, :card)
  end

  def find_expense
    @expense = Expense.find(params[:id])
  end
end
