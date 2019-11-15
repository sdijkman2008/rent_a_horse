class HorsesController < ApplicationController
  before_action :set_horse, only: [:show, :edit, :update, :destroy]

  def index
    @horses = Horse.geocoded
    policy_scope(Horse).order(:name)
    @markers = @horses.map do |horse|
      {
        lat: horse.latitude,
        lng: horse.longitude,
        # infoWindow: render_to_string(partial: "infowindow", locals: { horse: horse }),
        image_url: helpers.asset_url('Horse-marker.png')
      }
    if params[:query].present?
      sql_query = "address ILIKE :query"
      @horses = Horse.where(sql_query, query: "%#{params[:query]}%")
    end
    end
  end

  def show
    @reservation = Reservation.new
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
    authorize @horse
  end

  # PATCH /horses/:id
  def update
    if @horse.update(horse_params)
      redirect_to @horse
    else
      render :edit
    end
  end

  # DELETE /horses/:id
  def destroy
    @horse.destroy
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
