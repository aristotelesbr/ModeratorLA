class Expense < ActiveRecord::Base
  validates :value, presence: true

  def self.total
    self.sum(:value)
  end

  def self.total_card
    self.where(card: true).sum(:value)
  end
end
