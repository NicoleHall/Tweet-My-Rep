require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "login"
    assert_equal "/", current_path
    assert page.has_content?("ColeMersich")
    assert page.has_link?("logout")
  end

  test "logging out" do
    visit "/"
    click_link "login"
    assert User.find_by_name("ColeMersich")
    click_link "logout"
    refute page.has_content?("ColeMersich")
  end

end
