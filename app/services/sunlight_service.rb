class SunlightService

  include HTTParty
  base_uri 'https://congress.api.sunlightfoundation.com'

  def initialize
    @options = { apikey: ENV["sunlight_api_key"]}
  end

  def fetch_legislators(zip)
    response = self.class.get("/legislators/locate",
                query: @options.merge(zip: zip))
    parse_legislators(response)
  end


private

  def parse_legislators(response)
    response.parsed_response["results"]
  end
end
