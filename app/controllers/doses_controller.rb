class DosesController < ApplicationController
  before_action :set_coc, only: [:show, :new, :create]
  # before_action :set_ind, only: [:create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(str_params)
    @ingredient = Ingredient.find(params['dose']['ingredient'])
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_coc
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def str_params
    params.require(:dose).permit(:description)
  end
end
