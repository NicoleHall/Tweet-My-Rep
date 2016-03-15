require './test/test_helper'

class SunlightServiceTest < ActiveSupport::TestCase
  test "it finds the legislators for a given location" do
    VCR.use_cassette("sunlightservice#legs_for_zip") do
      legislators = SunlightService.legislators_for_zip('80205')

      assert legislators.find_index do |legislator|
        legislator.first_name == "Cory" &&
        legislator.last_name == "Gardner"
      end
    end
  end
end
