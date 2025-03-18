class CreateMealIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :meal_ingredients do |t|
      t.float :portion
      t.references :recipe, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.timestamps
    end
  end
end
