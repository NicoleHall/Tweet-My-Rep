require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "#index user visits root path gets success response" do
    VCR.use_cassette('localhost') do
      get :index
      assert_response :success
    end
  end
end
