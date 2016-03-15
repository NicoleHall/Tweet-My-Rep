class SunlightService

  include HTTParty
  base_uri 'https://congress.api.sunlightfoundation.com'

  @@options = { apikey: ENV["sunlight_api_key"]}

  def self.legislators_for_zip(zip)
    response = get("/legislators/locate",
                query: @@options.merge(zip: zip))
    parse_legislators(response)
  end

  private

  def self.parse_legislators(response)
    response.parsed_response["results"].map do |legislator_hash|
      Legislator.find_or_create_by(
        first_name: legislator_hash.fetch("first_name"),
        last_name: legislator_hash.fetch("last_name"),
        twitter_id: legislator_hash.fetch("twitter_id"),
      )
    end
  end
end
