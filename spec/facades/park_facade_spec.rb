require 'rails_helper'
describe ParkFacade do
  context "instance methods" do
    context "#parks_by_state" do
      it "returns array of parks OBJECT data", :vcr do
        all_parks = ParkFacade.find_parks_by_state("TN")
        expect(all_parks).to be_a Array
        expect(all_parks.count).to eq(16)

        park = all_parks.first
        expect(park).to be_a Park
        expect(park.name).to be_a(String)
        expect(park.description).to be_a(String)
        expect(park.directions).to be_a(String)
        expect(park.hours).to be_a(Hash)

        hours = park.hours
        expect(hours).to have_key :monday
        expect(hours[:monday]).to be_a(String)
        expect(hours).to have_key :tuesday
        expect(hours[:tuesday]).to be_a(String)
        expect(hours).to have_key :wednesday
        expect(hours[:wednesday]).to be_a(String)
        expect(hours).to have_key :thursday
        expect(hours[:thursday]).to be_a(String)
        expect(hours).to have_key :friday
        expect(hours[:friday]).to be_a(String)
        expect(hours).to have_key :saturday
        expect(hours[:saturday]).to be_a(String)
        expect(hours).to have_key :sunday
        expect(hours[:sunday]).to be_a(String)
      end
    end
  end
end
