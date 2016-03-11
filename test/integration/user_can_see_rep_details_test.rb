require 'test_helper'

class UserCanSeeRepDetailsTest < ActionDispatch::IntegrationTest
  test "user can see list of reps without being logged in" do
    VCR.use_cassette('legislators#search') do
      visit "/"

      assert_equal 200, page.status_code
      fill_in("Search your zipcode", :with => '80205')
      click_button "Search"
      assert_equal "/search", current_path

      assert page.has_content?("The legislators who represent you are:
        Cory Gardner,
        Diana DeGette,
        and Michael Bennet")

      assert page.has_button?("Sign in with Twitter")
      refute page.has_content?("Type tweet here")

    end
  end
end
