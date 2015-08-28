class Expense < ActiveRecord::Base
  validates :value, presence: true
  belongs_to :user

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


  # before_save :validate_salary
  after_create :create_invoices

  protected

  def create_invoices
    if quantity.present?
        interval = 1.month
        cicles = self.quantity
        start_date = Date.today
        current_date = start_date
        portions = self.value / self.quantity

        cicles.times do
          self.update(value: portions)
          Expense.create(
            value:  portions,
            description: description,
            user_id: user_id,
            created_at: (start_date += interval)
            )

            puts current_date
            puts portions

            current_date += interval
        end
    end
  end


  # def validate_salary
  #   self.value < Income.sum(:salary)
  # end
end
