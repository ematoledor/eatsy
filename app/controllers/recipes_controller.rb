class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end                                                                                                                                                                                                                                                                                                                                                                             

    def random
        @recipe = Recipe.all.shuffle[0]
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user = current_user
        @recipe.save

    
    end

    def order

    end

    private
    
    def recipe_params
        params.require(:recipe).permit(:title, :instructions, :prep_time, :vegetarian, :vegan, :gluten_free, :dairy_free, :very_healthy, :ketogenic, :servings, :source_id, :summary, images: [])
    end
end
