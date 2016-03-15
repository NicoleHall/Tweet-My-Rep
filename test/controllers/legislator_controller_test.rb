require 'test_helper'

class LegislatorsControllerTest < ActionController::TestCase
  test "#searh when user visits search they will get a success response" do
    VCR.use_cassette("localhost") do
      generate_five_random_zipcodes
      get :search
      assert_response :success
    end
  end
end
