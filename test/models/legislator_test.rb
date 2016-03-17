require 'test_helper'

class LegislatorTest < ActiveSupport::TestCase
  test "full_name returns the first and last name" do
    sean = Legislator.create(twitter_id: "sgrif", first_name: "Sean", last_name: "Griffin")
    tim  = Legislator.create(twitter_id: "timcook", first_name: "Tim", last_name: "Cook")

    assert_equal "Sean Griffin", sean.full_name
    assert_equal "Tim Cook", tim.full_name
  end

  test "duplicate legislator does not hit the db twice" do
    Legislator.create(twitter_id: "sgrif", first_name: "Sean", last_name: "Griffin")
    Legislator.create(twitter_id: "sgrif", first_name: "Sean", last_name: "Griffin")

    assert_equal 1, Legislator.count

  end

  test "two legislators can have same last name" do
    Legislator.create(twitter_id: "aglass", first_name: "Andy", last_name: "Griffin")
    Legislator.create(twitter_id: "sgrif", first_name: "Sean", last_name: "Griffin")

    assert_equal 2, Legislator.count
  end

  test "a legislator record can have an email" do
     will = Legislator.create(twitter_id: "wvmitchell", first_name: "Will", last_name: "Mitchell", email: "wvmitchell@gmail.com")

     assert_equal "wvmitchell@gmail.com", will.email
  end
end
