require './test/test_helper'

class SunlightServiceTest < ActiveSupport::TestCase
  test "it finds the legislators for a given location" do
    VCR.use_cassette("legislators#search") do
      visit "/"
      fill_in("Search your zipcode", :with => '80205')
      click_button "Search"
      assert page.has_content?("The legislators who represent you are:")
      assert page.has_content?("Cory Gardner")
      assert page.has_content?("Diana DeGette")
      assert page.has_content?("Michael Bennet")
    end
  end
end
