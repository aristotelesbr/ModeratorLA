class Income < ActiveRecord::Base

  def self.income_current
    where(created_at: Date.today.beginning_of_month..Date.today.end_of_day).sum(:salary)
  end

  def self.income_mont_ago
    where(created_at: 1.month.ago.beginning_of_month..1.month.ago.end_of_day).sum(:salary)
  end

end
