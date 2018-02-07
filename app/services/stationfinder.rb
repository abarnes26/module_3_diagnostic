class StationFinder
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def station_list
    NRELService.new()
  end

end
