class CocktailsController < ApplicationController
  before_action :set_coc, only: [:show]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = Dose.where(("cocktail_id='#{@cocktail.id}'"))
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(str_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def update_list
    @query = params[:update_list][:query]
    redirect_to cocktails_path if @query == ''
    @total = Cocktail.all.length
    @cocktails = Cocktail.where("name LIKE '%#{@query}%'")
  end

  private

  def set_coc
    @cocktail = Cocktail.find(params[:id])
  end

  def str_params
    params.require(:cocktail).permit(:name, :description)
  end
end
