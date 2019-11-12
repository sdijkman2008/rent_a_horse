class HorsesController < ApplicationController

    def index
      @horses = Horse.all
    end

    def show
      @horse = Horse.find(params[:id])
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
