class Admin::RestaurantsController < ApplicationController
  def index
    # Let's anticipate on next week (with login)
    @horses = current_user.horses
  end

  def show
    @horse = current_user.horse.find(params[:id])
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
    params.require(:horse).permit(:name)
  end
end
