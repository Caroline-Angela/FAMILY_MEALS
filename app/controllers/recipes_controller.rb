class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @user = current_user
    @mycomments = Comment.where(user_id: @user.id)
    @myrecipes = @mycomments.map do |comment|
      Recipe.find_by(id: comment.recipe_id)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
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
