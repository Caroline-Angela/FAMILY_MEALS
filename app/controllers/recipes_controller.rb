class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
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
