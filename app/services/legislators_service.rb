class LegislatorsService

  include HTTParty
  base_uri 'https://congress.api.sunlightfoundation.com'

  def fetch(zip)
    @options = { query: {apikey: ENV["sunlight_api_key"],
                            zip: params["zipcode"]} }

    search_results = self.class.get("/legislators/locate", @options)

    @twitter_ids = []
    search_results.first[1].each do |legislator|
      @twitter_ids << legislator['twitter_id']
    end
  end

  def fetched_legislators
    @legislators = LegislatorService.fetch(zip: params['zipcode'])
  end
end
