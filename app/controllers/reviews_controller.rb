class ReviewsController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @recipe = Recipe.find(params[:recipe_id])
        @review = Review.new
    end

    def create
      
      @recipe = Recipe.find(params[:recipe_id])
      @review = Review.new(review_params)
      @review.user = current_user
      @review.recipe = @recipe
      @review.save
      redirect_to recipe_reviews_path(@recipe)
    end

    def index
      @recipe = Recipe.find(params[:recipe_id])
      @reviews = @recipe.reviews
    end



    private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
