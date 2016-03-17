require './test/test_helper'

class SunlightServiceTest < ActiveSupport::TestCase
  test "it finds the legislators for a given location" do
    VCR.use_cassette("sunlight#legislators_for_zip") do
      generate_six_random_zipcodes
      legislators = SunlightService.legislators_by_long_lat_from_zip('80205')

      assert legislators.find_index do |legislator|
        legislator.first_name == "Cory" &&
        legislator.last_name == "Gardner"
      end
    end
  end
end
