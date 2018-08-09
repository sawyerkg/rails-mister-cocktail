class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [ :show, :edit, :update, :destroy ]


  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(
      name: cocktail_params["name"]
      )
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  def show

  end

  def update
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end
