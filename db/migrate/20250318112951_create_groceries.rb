class CreateGroceries < ActiveRecord::Migration[7.1]
  def change
    create_table :groceries do |t|
      t.boolean :completed
      t.string :note
      t.references :meal_ingredient, foreign_key: true
      t.timestamps
    end
  end
end
