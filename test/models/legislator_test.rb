require 'test_helper'

class LegislatorTest < ActiveSupport::TestCase
  test "twitter_handle returns the twitter id with an at sign" do
    assert_equal "@sgrif", Legislator.new(twitter_id: "sgrif").twitter_handle
    assert_equal "@timcook", Legislator.new(twitter_id: "timcook").twitter_handle
  end

  test "full_name returns the first and last name" do
    assert_equal "Sean Griffin", Legislator.new(first_name: "Sean", last_name: "Griffin").full_name
    assert_equal "Tim Cook", Legislator.new(first_name: "Tim", last_name: "Cook").full_name
  end
end
