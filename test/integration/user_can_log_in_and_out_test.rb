require 'test_helper'

class UserCanLogInAndOutTest < ActionDispatch::IntegrationTest

  test "logging out" do
    VCR.use_cassette('logging_out#destroy') do
      visit "/"
      click_link("logging_in")
      click_link("Logout")

      assert_equal root_path, current_path
      assert page.has_link?("Login")
      refute page.has_content?("ColeMersich")
    end
  end

end
