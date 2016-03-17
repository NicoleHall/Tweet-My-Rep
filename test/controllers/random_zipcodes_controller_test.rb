require 'test_helper'

class RandomZipcodesControllerTest < ActionController::TestCase
  test '#index returns a random zipcode record' do
    generate_six_random_zipcodes
    get :index
    assert_response :success
    assert_not_nil assigns(:random_zip)
  end
end
