class NytService

  include HTTParty
  base_uri 'http://api.nytimes.com/svc/search/v2/articlesearch.json'

  def initialize
    @options = { apikey: ENV["sunlight_api_key"] }
  end

  def search
    self.class.get("q=#{Legislator.full_name}", @options)
  end
end
