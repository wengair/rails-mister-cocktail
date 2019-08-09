class ReviewsController < ApplicationController
  before_action :set_coc, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(str_params)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  private

  def set_coc
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def str_params
    params.require(:review).permit(:rating, :content)
  end
end
