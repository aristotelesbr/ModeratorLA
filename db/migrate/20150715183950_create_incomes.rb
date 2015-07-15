class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :name
      t.float :salary

      t.timestamps null: false
    end
  end
end
