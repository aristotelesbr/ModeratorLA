class ExpensesController < ApplicationController
  before_action :find_expense, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @expense = Expense.new
  end

  def show
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      redirect_to @expense, notice: 'notice.expense.success'
    else
      render 'new'
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
