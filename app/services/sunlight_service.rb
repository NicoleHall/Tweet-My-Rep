class SunlightService

  include HTTParty
  base_uri 'https://congress.api.sunlightfoundation.com'

  def initialize
    @options = { apikey: ENV["sunlight_api_key"]}
  end

  def legislators_for_zip(zip)
    response = self.class.get("/legislators/locate",
                query: @options.merge(zip: zip))
    parse_legislators(response)
  end

  private

  def parse_legislators(response)
    response.parsed_response["results"].map do |legislator_hash|
      Legislator.find_or_create_by(
        first_name: legislator_hash.fetch("first_name"),
        last_name: legislator_hash.fetch("last_name"),
        twitter_id: legislator_hash.fetch("twitter_id"),
      )
    end
  end
end
