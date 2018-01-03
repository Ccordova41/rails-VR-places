class VenuesController < ApplicationController

  def show
    @venues = Venue.all
  end
end
