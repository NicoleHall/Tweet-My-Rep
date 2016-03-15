require 'test_helper'

class RandomZipcodesControllerTest < ActionController::TestCase

  test '#index returns a random zipcode record' do
    create_three_zips
    get :index
    assert_response :success
  end

  private

  def create_three_zips
     zipcodes =
      [{postal_code: "17936",
      place_name: "Gordon",
      state: "Pennsylvania",
      state_abbreviation: "PA",
      county: "Schuylkill",
      latitude: "40.7489",
      longitude: "-76.3355"},

     {postal_code: "24527",
      place_name: "Blairs",
      state: "Virginia",
      state_abbreviation: "VA",
      county: "Pittsylvania",
      latitude: "36.7102",
      longitude: "-79.3381"},

      {postal_code: "67024",
      place_name: "Cedar Vale",
      state: "Kansas",
      state_abbreviation: "KS",
      county: "Chautauqua",
      latitude: "37.1265",
      longitude: "-96.4701"}]
      zipcodes.each {|zip| Zipcode.create(zip)}
  end
end
