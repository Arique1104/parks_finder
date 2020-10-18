class ParkFacade
  def self.find_parks_by_state(state)
    json = ParkService.find_parks_by_state(state)
    @parks = json[:data].map do |park_data|
      Park.new(park_data)
    end
  end
end
