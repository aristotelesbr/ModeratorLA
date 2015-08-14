class CreatePortions < ActiveRecord::Migration
  def change
    create_table :portions do |t|
      t.integer :portion_quantity
      t.string :card
      t.belongs_to :expense, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
