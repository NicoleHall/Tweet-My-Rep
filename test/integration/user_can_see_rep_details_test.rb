require 'test_helper'

class UserCanSeeRepDetailsTest < ActionDispatch::IntegrationTest
  test "user must be logged in to see list of reps" do
    VCR.use_cassette('legislators#search') do
      visit "/"
      refute page.has_content?("Search your zipcode")

      click_link("logging_in")
      fill_in("Search your zipcode", :with => '80205')
      click_button "Search"
      assert_equal "/search", current_path

      assert page.has_content?("The legislators who represent you are:
        Cory Gardner,
        Diana DeGette,
        and Michael Bennet")
    end
  end
end
