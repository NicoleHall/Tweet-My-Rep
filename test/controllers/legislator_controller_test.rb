require 'test_helper'

class LegislatorsControllerTest < ActionController::TestCase
  test "#searh when user visits search they will get a success response" do
    VCR.use_cassette('localhost') do
      get :search
      assert_response :success
    end
  end
end
