require 'test_helper'

class ZipcodeTest < ActiveSupport::TestCase
  test "it can find a random zipcode" do
    generate_five_random_zipcodes

    result1 = Zipcode.get_a_random_zip
    result2 = Zipcode.get_a_random_zip
    result3 = Zipcode.get_a_random_zip

    refute_equal result1.postal_code, result2.postal_code
    refute_equal result2.postal_code, result3.postal_code
  end

  test "it can check if a zipcode exists in the database" do
    assert Zipcode.zipcode_does_not_exist?("00000")
  end
end
