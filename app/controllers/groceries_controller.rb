class GroceriesController < ApplicationController
  before_action :set_grocery, only: :mark_complete

  def index
    today = Date.today
    @today_groceries = Grocery
      .joins(meal_ingredient: { recipe: :menus })
      .includes(meal_ingredient: [:ingredient, :recipe])
      .where(menus: { date: today })
      .distinct

    @all_groceries = Grocery
      .includes(meal_ingredient: [:ingredient, :recipe])
      .distinct
  end

  def mark_complete
    @grocery.update(completed: !@grocery.completed)
    redirect_to groceries_path
  end

  private

  def set_grocery
    @grocery = Grocery.find(params[:id])
  end
end
