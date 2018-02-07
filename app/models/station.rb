class Station
  attr_reader :name, :address, :fuel_types, :distance, :access_times

  def initialize(station)
    @name = station[:station_name]
    @address = station[:street_address]
    @fuel_types = station[:fuel_type_code]
    @distance = station[:distance].round(2)
    @access_times = station[:access_days_time]
  end

  # t.string "name"
  # t.string "address"
  # t.string "fuel_types"
  # t.float "distance"
  # t.datetime "access_times"

end
