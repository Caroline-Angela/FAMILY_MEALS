class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.integer :duration
      t.string :description_easy
      t.integer :duration_easy

      t.timestamps
    end
  end
end
