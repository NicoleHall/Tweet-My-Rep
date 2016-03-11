require 'test_helper'

class UserMustAuthenticateToBeAbleToTweetRepTest < ActionDispatch::IntegrationTest
  test "user must login via Twitter to tweet a rep" do
    VCR.use_cassette("tweets#create") do
      visit "/"
      fill_in("Search your zipcode", :with => '80205')
      click_button "Search"

      assert_equal "/search", current_path
      refute page.has_content?("Type tweet here")

      click_button "Sign in with Twitter"
      assert page.has_content?("ColeMersich")
      assert page.has_content?("Type tweet here")
      assert page.has_button?("Send Tweet")
    
    end
  end
end
