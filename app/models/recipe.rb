class Recipe < ApplicationRecord
  has_many :meal_ingredients
  has_many :comments
  has_many :menus
end
