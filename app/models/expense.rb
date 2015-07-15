class Expense < ActiveRecord::Base
  validates :value, presence: true
  belongs_to :income
            # receita
  def self.total
    self.sum(:value)
  end

  def self.total_card
    self.where(card: true).sum(:value)
  end

  def self.sum_salario
    self.joins(:income).sum('incomes.salary')
  end
end
