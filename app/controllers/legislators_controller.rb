class LegislatorsController < ApplicationController
  # include LegislatorsService

  include HTTParty
  base_uri 'https://congress.api.sunlightfoundation.com'


  def search
    # LegislatorsService.fetch(params["zipcode"])
    @options = { query: {apikey: ENV["sunlight_api_key"],
                        zip: params["zipcode"]} }
    #{}"/legislators/locate?apikey=#{ENV["sunlight_api_key"]}&zip=#{zipcode}"
    search_results = self.class.get("/legislators/locate", @options)

    @twitter_ids = []
    search_results.first[1].each do |legislator|
      @twitter_ids << legislator['twitter_id']
    end
    @twitter_ids
  end

  def results
    self.search
    # LegislatorsService.fetched_legislators
  end

end
