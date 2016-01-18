require './test/test_helper'

class SunlightServiceTest < ActiveSupport::TestCase
  include Capybara::DSL
  test "it finds the legislators for a given location" do

    corey = Legislator.new(first_name: "Corey", last_name: "Gardner", twitter_id: "corey_gardner")
    tom = Legislator.new(first_name: "Tom", last_name: "Udall", twitter_id: "SenatorTomUdall")
    martin = Legislator.new(first_name: "Martin", last_name: "Heinrich", twitter_id: "MartinHeinrich")
    #
    # visit "congress.api.sunlightfoundation.com/legislators/locate?zip=80205&apikey=9f19d387e7904184af2eb15c6c1d7bc5"

    stub_sunlight_api(zip: 80031, legislators: [corey, tom])
    stub_sunlight_api(zip: 87106, legislators: [martin])

    legislators_for_colorado = SunlightService.new.legislators_for_zip(80031)
    legislators_for_new_mexico = SunlightService.new.legislators_for_zip(87106)

    assert_equal [corey, tom], legislators_for_colorado
    assert_equal [martin], legislators_for_new_mexico
  end

  private

  def stub_sunlight_api(zip:, legislators:)
    legislators_json = legislators.map do |legislator|
      {
        first_name: legislator.first_name,
        last_name: legislator.last_name,
        twitter_id: legislator.twitter_handle[1..-1],
      }
    end
    stub_request(:get, "https://congress.api.sunlightfoundation.com/legislators/locate?apikey=apikey&zip=#{zip}")
      .to_return(
        headers: { content_type: "application/json" },
        body: { results: legislators_json }.to_json,
      )
  end
end
