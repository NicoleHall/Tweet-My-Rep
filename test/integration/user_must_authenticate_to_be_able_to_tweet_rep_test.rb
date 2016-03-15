require 'test_helper'

class UserMustAuthenticateToBeAbleToTweetRepTest < ActionDispatch::IntegrationTest
  test "user must login via Twitter to tweet a rep" do
    VCR.use_cassette("tweets#create") do

      visit root_path

      refute page.has_content?("Search your zipcode")

      click_link("logging_in")

      assert page.has_content?("Search your zipcode")
    end
  end

  test "after logging in user can searh and tweet" do
    VCR.use_cassette("legislators#search") do
      visit "/"
      click_link("logging_in")
      fill_in("Search your zipcode", :with => '80205')
      click_button("searching")

      assert_equal search_path, current_path
      assert page.has_content?("The legislators who represent you are:")
      assert page.has_content?("Type tweet here")
      assert page.has_button?("Send Tweet")
    end
  end
end
