class NytService

  include HTTParty
  base_uri 'http://api.nytimes.com/svc/search/v2/articlesearch.json'

  def initialize(api_key)
    @options = { apikey: api_key }
  end

  def search
    self.class.get("q=#{Legislator.full_name}", @options)
  end
end
