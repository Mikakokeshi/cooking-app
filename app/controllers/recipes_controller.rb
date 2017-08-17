class RecipesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    
    def index
      @recipes = current_user.recipes.all
    end
    def new
       @recipe = Recipe.new 
    end
    
    def create
       @recipe = current_user.recipes.new(recipe_params)
       if @recipe.save
           redirect_to @recipe, notice: "Your recipe is now shared with other users."
       else
           render 'new', notice: "Your recipe was not posted."
       end
    end
    
    def show
    end

    def edit
    end
    
    def update
       if @recipe.update(recipe_params)
           redirect_to @recipe, notice: "Your recipe is updated."
       else
           render 'edit', notice: "Update failed."
       end
    end
    
    def destroy
      @recipe.destroy
      redirect_to recipes_path, notice: "Recipe deleted."
    end
    
    private
      def recipe_params
        params.require(:recipe).permit(:title, :ingredients, :image)
      end
      
      def set_recipe
        @recipe = Recipe.find(params[:id]) 
      end
end
