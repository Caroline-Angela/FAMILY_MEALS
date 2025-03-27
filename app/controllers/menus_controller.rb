class MenusController < ApplicationController

  def new
    @menu = Menu.new
    @myrecipes = current_user.recipes
            .joins(:comments)
            .where(comments: { favorite: true })
            .distinct
  end

  def create_from_calendar
    @menu = Menu.new(menu_params)
    @menu.cook_name = current_user.first_name
    if @menu.save
      redirect_to calendar_path
    else
      raise
    end
  end


  def create
    #@menus
    @recipe = Recipe.find(params[:recipe_id])
    date = menu_params[:date].to_date
    @menu = Menu.new(date: date)
    @menu.recipe = @recipe
    # @calendar = Calendar.last # it is hardcoded for the moment
    @usercalendar = UserCalendar.find_by(user_id: current_user.id)
    @calendar = @usercalendar.calendar
    @menu.calendar = @calendar
    @menu.cook_name = current_user.first_name
    if @menu.save
      redirect_to calendar_path, notice: "Menu successfully added!"
    else
      render :add, status: unprocessable_entity
    end

  end

  private

  def menu_params
    params.require(:menu).permit(:recipe_id, :date, :calendar_id)
  end
end
