class StationFinder
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def station_list
    NRELService.new(@params).stations.each do |station|
      Station.new(station)
    end
  end

end
