class NRELService

  def initialize(params)
    @params = params
  end

  def stations
    get_json("alt-fuel-stations/v1/nearest.json?fuel_type=LPG,ELEC&zip=#{@params}&radius=6.0&limit=10")
  end

  private

    def conn
      Faraday.new("https://api.data.gov/nrel/") do |faraday|
        faraday.headers['X-Api-Key'] = ENV['NREL_API_KEY']
        faraday.adapter           Faraday.default_adapter
      end
    end

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

end
