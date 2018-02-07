require 'rails_helper'

feature "User can visit root page" do
  scenario "and view navbar contents" do
    visit "/"
    within(".navbar") do
      expect(page).to have_content("AltFuelFinder")
      expect(page).to have_selector("input[value='Search by zip...']")
    end
  end

  describe "and searches for stations by zipcode" do
    it "sees search page with a list of stations" do
      VCR.use_cassette("station_list") do
        visit '/'

        within(".navbar") do
          find(:css, "input[value='Search by zip...']").set("80232")
          click_button "Locate"
        end

        expect(current_path).to eq('/search')
        expect(page).to have_content("Nearby Stations")
      end
    end
  end

  # As a user
  # When I visit "/"
  # And I fill in the search form with 80203
  # And I click "Locate"
  # Then I should be on page "/search" with parameters visible in the url
  # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
  # And the stations should be limited to Electric and Propane
  # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

end
