class ParkService
  def self.find_parks_by_state(state)
    response = Faraday.get("https://developer.nps.gov/api/v1/parks?") do |faraday|
      faraday.params[:stateCode] = "#{state}"
      faraday.params[:api_key] = "#{ENV['PARK_API_KEY']}"
    end
    parse = JSON.parse(response.body, symbolize_names: true)
  end
end
