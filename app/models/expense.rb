class Expense < ActiveRecord::Base
  validates :value, presence: true
  belongs_to :user

  def self.total
    sum(:value)
  end

  def self.total_card
    where(card: true).sum(:value)
  end

  # def self.sum_salario
  #   self.includes(:income).sum(:salary)
  # end
end
