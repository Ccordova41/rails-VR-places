class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  @array = ["Pizza","Sushi","Potato Chips"]

  def hello
    @venues = Venue.all
    respond_to do |format|
      format.html { render :hello }
      format.json { render json: @venues }
    end
  end

 end
