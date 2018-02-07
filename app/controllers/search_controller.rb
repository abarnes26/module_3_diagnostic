class SearchController < ApplicationController

  def index
    @stations = StationFinder.new(params[:q])
  end

end
