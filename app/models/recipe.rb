class Recipe < ApplicationRecord
  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients
  has_many :comments
  has_many :menus
  has_many :ingredients, through: :meal_ingredients
  has_one_attached :photo


  private

  def future_date
    return if opening_date.blank?
    errors.add(:opening_date, "must be in the future") if opening_date < Date.current
  end
end
