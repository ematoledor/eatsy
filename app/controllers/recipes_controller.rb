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
    #Old logic for picking random recipes
    #@recipe = Recipe.all.shuffle[0]
    @recipe = Recipe.all.sample
    

    if params[:vegan]
      @recipe = Recipe.where(vegan: true).sample
    end

    if params[:vegetarian]
      @recipe = Recipe.where(vegetarian: true).sample
    end

    if params[:gluten_free]
      @recipe = Recipe.where(gluten_free: true).sample
    end

    if params[:dairy_free]
      @recipe = Recipe.where(dairy_free: true).sample
    end

    if params[:ketogenic]
      @recipe = Recipe.where(ketogenic: true).sample
    end
    
    

    redirect_to recipe_path(@recipe, params.permit(params.keys).to_h)
    
  end

  def new
    @recipe = Recipe.new
  end

  def create
  	@recipe = Recipe.new(recipe_params)
  	@recipe.user = current_user
  	@recipe.save
  end

  def instruction
  	@recipe = Recipe.find(params[:id])
    @portions = Portion.where(recipe_id: @recipe.id)     
	end

  def order
    params.permit!  
  	@recipe = Recipe.find(params[:id])
    @portions = Portion.where(recipe_id: @recipe.id)
    
    selected_ingredients = params.to_h.filter do |key,value|
      key.start_with?('ingredient_')
    end
    
    # Ingredients selected by the user
    temp = (selected_ingredients.map {|ingredient, _| ingredient.gsub('ingredient_', '')}).map(&:to_i)
    
    
    # Ingredients which are part of the Recipe#Portion
    @actual_ingredients = @portions.map do |portion|
      portion.ingredient.id
    end

    # Ingredients which have to be ordered
    #@ingredients_to_order = @actual_ingredients.reject{|ingredient| temp.include?(id:)}

    ingredients_to_order = @actual_ingredients.reject {|ingredient| temp.include?(ingredient)}
    
    # instantiate a Variable so as to be used in order.html.erb
    @ingredients = Ingredient.where(id: ingredients_to_order)

    total = @ingredients.reduce(0) { |sum, ingredient| sum + ingredient.price }
    @total = total
    



  end

  def thankyou

  end

  def accountsummary

  end

  


  private

  def recipe_params
    params.require(:recipe).permit(:title, :instructions, :prep_time, :vegetarian, :vegan, :gluten_free, :dairy_free, :very_healthy, :ketogenic, :servings, :source_id, :summary, images: [])
  end

end
