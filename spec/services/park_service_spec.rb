require 'rails_helper'

describe ParkService do
  context 'class methods' do
    context 'returns park data' do
      scenario 'test_park_service', :vcr do
        results = ParkService.find_parks_by_state('TN')
        expect(results).to have_key :data


      end
    end
  end
end
