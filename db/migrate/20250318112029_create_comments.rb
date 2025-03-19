class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.integer :rating
      t.boolean :favorite
      t.references :recipe, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
