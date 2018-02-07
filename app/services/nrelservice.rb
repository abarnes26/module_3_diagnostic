class NRELService

  def initialize(params)
    @params = params
  end

  def stations
    get_json("alt-fuel-stations/v1.json?fuel_type=LPG,ELEC&zip=#{@params}&limit=10")
  end

  private

    def conn
      Faraday.new("https://api.data.gov/nrel/") do |faraday|
        faraday.header['X-Api-Key'] = ENV['NREL_API_KEY']
        faraday.adapter           Faraday.default_adapter
      end
    end

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true))
    end

end
