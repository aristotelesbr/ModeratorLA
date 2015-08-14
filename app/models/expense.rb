class Expense < ActiveRecord::Base
  validates :value, presence: true
  belongs_to :user
  has_many :portions
    accepts_nested_attributes_for :portions, reject_if: :all_blank, allow_destroy: true

  def self.total
    where(created_at: Date.today.beginning_of_month..Date.today.end_of_day).sum(:value)
  end

  def self.expense_current_sum
    where(created_at: Date.today.beginning_of_month..Date.today.end_of_day).sum(:value)
  end

  def self.expense_month_ago
    where(created_at: 1.month.ago.beginning_of_month..1.month.ago.end_of_day).sum(:value)
  end

  def self.expense_current_month
    where(created_at: (Date.today.beginning_of_month..Date.today.end_of_month))
  end

  # Controller/reports
  def self.desp
    where(created_at: Date.today.beginning_of_month..Date.today.end_of_day).sum(:value)
  end

  before_save :validate_salary

  protected

  def validate_salary
    self.value < Income.sum(:salary)
  end
end
