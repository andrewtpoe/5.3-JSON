class PalettesController < ApplicationController

  def index
    @palettes = Palette.all

    respond_to do |format|
      format.json { render json: @palettes }
    end
  end

  def show
    @palette = get_palette
    respond_to do |format|
      format.json { render json: @palette }
    end
  end

  def create
    @palette = Palette.new(palette_params)
    respond_to do |format|
      if @palette.save
        format.json { render status: :created, json: @palette }
      else
        format.json { render json: @palette.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def get_palette
    Palette.find(params[:id])
  end

  def palette_params
    params.require(:palette).permit(:name, :dom_one, :dom_two, :pop, :sec_one, :sec_two)
  end

end
