class VenuesController < ApplicationController

  before_action :venue_var, only: [:show, :edit, :update, :destroy, :collection]

    def new
      @venue = Venue.new
    end

    def create
      @venue = Venue.new(venue_params)
      if @venue.save
        redirect_to venue_path(@venue)
      else
        render :new
      end
    end

    def show
    end

    def edit
    end

    def update
      if @venue.update(venue_params)
        redirect_to venue_path(@venue)
      else
        render :edit
      end
    end

    def destroy
      @venue.destroy
      redirect_to root_path
    end

    def collection
      @experiences = @venue.experiences
      render json: @experiences
    end

    private
      def venue_params
        params.require(:venue).permit(:name, :description, :location_id, location_attributes: [:name])
      end
      def venue_var
        @venue = Venue.find(params[:id])
      end
    end
