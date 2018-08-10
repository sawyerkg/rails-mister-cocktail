class CocktailsController < ApplicationController
  # before_action :set_cocktail, only: [ :create, :show, :edit, :update, :destroy ]


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
      redirect_to @cocktail
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    Cocktail.destroy(params[:id])
    redirect_to cocktails_path
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.all.select { |dose| dose.cocktail == @cocktail }
  end

  def update
  end

  private

  # def set_cocktail
  #   @cocktail = Cocktail.find(params[:id])
  # end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end
