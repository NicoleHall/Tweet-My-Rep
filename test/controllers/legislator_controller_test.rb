require 'test_helper'

class LegislatorsControllerTest < ActionController::TestCase
  test "#search redirects to root if no zip provided" do
    VCR.use_cassette("legislator#search") do
      get :search
      assert_redirected_to root_path
    end
  end
end
