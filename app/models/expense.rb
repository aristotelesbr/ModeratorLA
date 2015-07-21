  class Expense < ActiveRecord::Base
  validates :value, presence: true
  belongs_to :user

  def self.total
    where(created_at: Date.today.beginning_of_month..Date.today.end_of_month).sum(:value)
  end

  def self.total_card
    where(card: true).sum(:value)
  end

  def self.desp
    where(created_at: Date.today.beginning_of_month..Date.today.end_of_month).sum(:value)
  end

  before_save :validate_salary

  protected

  def validate_salary
    self.value < Income.sum(:salary)
  end
end
