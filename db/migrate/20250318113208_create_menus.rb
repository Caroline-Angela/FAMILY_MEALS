class CreateMenus < ActiveRecord::Migration[7.1]
  def change
    create_table :menus do |t|
      t.date :date
      t.integer :participants
      t.string :cook_name
      t.integer :menu_style
      t.references :recipe, foreign_key: true
      t.references :calendar, foreign_key: true
      t.timestamps
    end
  end
end
