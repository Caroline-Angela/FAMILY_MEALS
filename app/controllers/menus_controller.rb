class MenusController < ApplicationController

  def new
    @menu = Menu.new
    @myrecipes = current_user.recipes
            .joins(:comments)
            .where(comments: { favorite: true })
            .distinct
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      redirect_to calendar_path
    else
      raise
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:recipe_id, :date, :calendar_id)
  end

end
