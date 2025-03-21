class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    @comments = Comment.all
    @mycomments = Comment.where(user_id: current_user.id)
    @myrecipes = current_user.recipes
                            .joins(:comments)
                            .where(comments: { favorite: true })
                            .distinct
    @recipes -= @myrecipes

    @usercalendar = UserCalendar.find_by(user_id: current_user.id)
    @calendar = @usercalendar.calendar
    @menus = Menu.where(calendar_id: @calendar.id)

    @active_tab = params[:active_tab] || "myfavorites"

    if params[:query].present?
      sql_subquery = 'recipes.title ILIKE :query
        OR recipes.description ILIKE :query
        OR ingredients.ingredient_name ILIKE :query'
      @recipes = Recipe.all.joins(meal_ingredients: :ingredient)
                       .where(sql_subquery, query:"%#{params[:query]}%")
                       .distinct
      @myrecipes = @myrecipes.joins(meal_ingredients: :ingredient)
                             .where(sql_subquery, query:"%#{params[:query]}%")
                             .distinct
#        @recipes -= @myrecipes
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    # @ingredients = @recipe.ingredients
    @meal_ingredients = @recipe.meal_ingredients
    # @menu = @recipe.menu
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to root_path, notice: "Recipe successfully created!"
    else
      render :add, status: unprocessable_entity
    end
  end


  def edit

  end


end


def recipe_params
  params.require(:recipe).permit(:title, :description, :duration, :description_easy, :duration_easy)
end
