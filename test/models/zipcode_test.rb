require 'test_helper'

class ZipcodeTest < ActiveSupport::TestCase
  test "it can find a random zipcode" do
    zipcode_1 = Zipcode.create(
      postal_code: "17936",
      place_name: "Gordon",
      state: "Pennsylvania",
      state_abbreviation: "PA",
      county: "Schuylkill",
      latitude: "40.7489",
      longitude: "-76.3355")

    zipcode_2 = Zipcode.create(
      postal_code: "24527",
      place_name: "Blairs",
      state: "Virginia",
      state_abbreviation: "VA",
      county: "Pittsylvania",
      latitude: "36.7102",
      longitude: "-79.3381")

    zipcode_3 = Zipcode.create(
      postal_code: "67024",
      place_name: "Cedar Vale",
      state: "Kansas",
      state_abbreviation: "KS",
      county: "Chautauqua",
      latitude: "37.1265",
      longitude: "-96.4701")

    result1 = Zipcode.get_a_random_zip
    result2 = Zipcode.get_a_random_zip
    result3 = Zipcode.get_a_random_zip

    refute_equal result1.postal_code, result2.postal_code && result3.postal_code
    refute_equal result2.postal_code, result3.postal_code && result1.postal_code
  end
end
