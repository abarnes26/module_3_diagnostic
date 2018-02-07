class SearchController < ApplicationController

  def index
    @stations = StationFinder.new(params[:q]).station_list
  end

end
