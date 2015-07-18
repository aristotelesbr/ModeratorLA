class Expense < ActiveRecord::Base
  validates :value, presence: true
  belongs_to :user

  def self.total
    sum(:value)
  end

  def self.total_card
    where(card: true).sum(:value)
  end

  before_save :valida

  protected

  def valida
    self.value < (1900)
  end
end
