class HorsesController < ApplicationController
  before_action :set_horse, only: [:show]

  def index
    @horses = Horse.all
  end

  def show
  end

  def new
    @horse = Horse.new
  end

  def create
    @horse = Horse.new(horse_params)
    if @horse.save
      redirect_to horse_path
    else
      render :new
    end
  end

  private

  def horse_params
    params.require(:horse).permit(:name, :photo)
  end

  def set_horse
    @horse = Horse.find(params[:id])
  end
end
