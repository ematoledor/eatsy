class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def new
        @recipe = Recipe.find(params[:recipe_id])
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @recipe = Recipe.find(params[:recipe_id])
        @review.recipe = @recipe
        @review.save
        redirect_to recipe_path(@recipe)
    end

    private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
