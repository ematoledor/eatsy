class RecipesController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :random ]

    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])

        @review = Review.where(recipe_id: @recipe.id)
        @portions = Portion.where(recipe_id: @recipe.id)

    end                                                                                                                                                                                                                                                                                                                                                                             

    def random
        @recipe = Recipe.all.shuffle[0]
        redirect_to recipe_path(@recipe)
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
