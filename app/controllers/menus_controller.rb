class MenusController < ApplicationController

  def create
    #@menus
    @recipe = Recipe.find(params[:recipe_id])
    date = menu_params[:date].to_date
    @menu = Menu.new(date: date)
    @menu.recipe = @recipe
    @calendar = Calendar.last # it is hardcoded for the moment
    @menu.calendar = @calendar
    @menu.save
    redirect_to recipe_path(@recipe)

  end

  private
  def menu_params
    params.require(:menu).permit(:date)
  end


end
