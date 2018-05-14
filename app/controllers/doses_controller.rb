class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @cocktail = Cocktail.new
    # @ingredient = Ingredient.new
  end

  def create
    id_ingredient = params["dose"]["ingredient_id"].to_i
    @dose = Dose.new(dose_params)
    @dose.ingredient = Ingredient.find(id_ingredient)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :cocktail_id, :quantity, :description)
  end

end
