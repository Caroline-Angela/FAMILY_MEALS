class Recipe < ApplicationRecord
  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients
  has_many :comments
  has_many :menus
  has_many :ingredients, through: :meal_ingredients
end
