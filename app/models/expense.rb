class Expense < ActiveRecord::Base
  validates :value, presence: true
end
