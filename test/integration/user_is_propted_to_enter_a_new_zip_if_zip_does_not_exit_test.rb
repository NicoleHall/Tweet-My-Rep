require 'test_helper'

class UserIsProptedToEnterANewZipIfZipDoesNotExitTest < ActionDispatch::IntegrationTest
  test "user is propted to enter a new zip if zip does not exist" do
    VCR.use_cassette("legislators#wrong_zip") do
      visit "/"
      fill_in("Search your zipcode", :with => '55555')
      click_button "Search"
      assert_equal search_path, current_path
      assert page.has_link?("You've entered an invalid zip, try again")

      click_link("You've entered an invalid zip, try again")

      assert_equal root_path, current_path
      assert page.has_content?("Search your zipcode")
    end
  end
end
