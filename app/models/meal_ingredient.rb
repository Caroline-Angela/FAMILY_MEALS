class MealIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  has_many :groceries
end
