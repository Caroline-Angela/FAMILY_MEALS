class Ingredient < ApplicationRecord
  has_many :meal_ingredients
  has_many :recipes, through: :meal_ingredients
end
