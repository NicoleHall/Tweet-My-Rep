require 'test_helper'

class RandomZipcodesControllerTest < ActionController::TestCase
  test '#index returns a random zipcode record' do
    VCR.use_cassette('localhost')do
      get :index
      assert_response :success
      assert_not_nil assigns(:random_zip)
    end
  end
end
