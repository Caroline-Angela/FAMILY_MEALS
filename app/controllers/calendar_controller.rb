class CalendarController < ApplicationController

  def index
    @usercalendar = UserCalendar.find_by(user_id: current_user.id)
    @calendar = @usercalendar.calendar
    @menus = Menu.where(calendar_id: @calendar.id).where('date >= ?', Date.today).order(date: :asc)

    @recipes = Recipe.joins(:menus).where(menus: { id: @menus.select(:id) })
    @mealingredients = MealIngredient.all

    @all_groceries = Grocery
        .includes(meal_ingredient: [:ingredient, :recipe])
        .distinct

    today = Date.today
    @today_groceries = Grocery
      .joins(meal_ingredient: { recipe: :menus })
      .includes(meal_ingredient: [:ingredient, :recipe])
      .where(menus: { date: today })
      .distinct

      @completed_groceries = Grocery
      .where(completed: true)
      .distinct


  end

end
