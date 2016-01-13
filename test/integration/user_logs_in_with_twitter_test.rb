require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "Login"
    assert_equal "/", current_path
    assert page.has_content?("ColeMersich")
    assert page.has_link?("Logout")
  end

  test "logging out" do
    visit "/"
    click_link "Login"
    assert User.find_by_name("ColeMersich")
    click_link "Logout"
    refute page.has_content?("ColeMersich")
  end

end
