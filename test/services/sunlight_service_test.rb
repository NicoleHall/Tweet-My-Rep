require './test/test_helper'

class SunlightServiceTest < ActiveSupport::TestCase
  test "it finds the legislators for a given location" do
    sunlight_service = SunlightService.new("apikey")
    corey = Legislator.new(first_name: "Corey", last_name: "Gardner", twitter_id: "corey_gardner")
    sean = Legislator.new(first_name: "Sean", last_name: "Griffin", twitter_id: "sgrif")
    tim = Legislator.new(first_name: "Tim", last_name: "Cook", twitter_id: "timcook")

    stub_sunlight_api(zip: 80031, legislators: [corey, sean])
    stub_sunlight_api(zip: 87106, legislators: [tim])

    legislators_for_colorado = sunlight_service.legislators_for_zip(80031)
    legislators_for_new_mexico = sunlight_service.legislators_for_zip(87106)

    assert_equal [corey, sean], legislators_for_colorado
    assert_equal [tim], legislators_for_new_mexico
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
