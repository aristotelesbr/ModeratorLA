class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.float :value
      t.text :description
      t.boolean :card

      t.timestamps null: false
    end
  end
end
