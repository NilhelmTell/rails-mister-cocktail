class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def new
    @new_cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @dose = Dose.new
  end

  def edit

  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktails_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Only allow a list of trusted parameters through.
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
