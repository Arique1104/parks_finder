

require 'rails_helper'

RSpec.describe "Park Search" do
  scenario 'search_parks_by_state', :vcr do
    visit root_path
    select 'Tennessee', from: :state
    click_on 'Find Parks'
    expect(current_path).to eq('/parks')
    expect(page).to have_content('Search Results: 16')
    expect(page).to have_css('.parks', count: 16)
    within(first('.parks')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.hours')
      expect(page).to have_css('.description')
      expect(page).to have_css('.directions')
    end
  end
end
