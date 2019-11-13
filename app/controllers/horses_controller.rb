class HorsesController < ApplicationController
  before_action :set_horse, only: [:show]

  def index
    @horses = Horse.all
    @restaurants = policy_scope(Horse).order(:name)
  end

  def show
    @horse = Horse.find(params[:id])
  end

  # GET
  def new
    @horse = Horse.new
    authorize @horse
  end

  # POST
  def create
    @horse = Horse.new(horse_params)
    @horse.user = current_user
    authorize @horse
    if @horse.save
      redirect_to @horse
    else
      render :new
    end
  end

  # GET /horses/:id/edit
  def edit
    @horse = Horse.find(params[:id])
    authorize @horse
  end

  # PATCH /horses/:id
  def update
    @horse = Horse.find(params[:id])
    @horse.update(horse_params)
    authorize @horse
  end

  # DELETE /horses/:id
  def destroy
    @horse = Horse.find(horse_params[:id])
    @horse.destroy
    authorize @horse
    redirect_to horses_path
  end

  private

  def horse_params
    params.require(:horse).permit(:name, :address, :price, :level, :breed, :description, :photo, :photo_cache)
  end

  def set_horse
    @horse = Horse.find(params[:id])
    authorize @horse
  end
end
