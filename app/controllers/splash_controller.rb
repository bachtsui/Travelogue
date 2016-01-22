class SplashController < ApplicationController
  def index
  	@cities = City.all
  end
end
