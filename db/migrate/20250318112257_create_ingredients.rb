class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.string :ingredient_name
      t.string :category

      t.timestamps
    end
  end
end
