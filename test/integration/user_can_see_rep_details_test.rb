require 'test_helper'

class UserCanSeeRepDetailsTest < ActionDispatch::IntegrationTest
  test "user must be logged in to see list of reps" do
    VCR.use_cassette('legislators#search') do
      generate_six_random_zipcodes
      visit "/"
      refute page.has_content?("Search your zipcode")

      click_link("logging_in")
      fill_in("Search your zipcode", :with => '90210')
      click_button("searching")
      
      assert_equal "/search", current_path
      assert page.has_content?("The legislators who represent you are: ")
      assert page.has_content?("Ted Lieu")
      assert page.has_content?("Barbara Boxer")
      assert page.has_content?("Dianne Feinstein")
    end
  end
end
