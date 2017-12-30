class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    @venues = Venue.all
  end
end
