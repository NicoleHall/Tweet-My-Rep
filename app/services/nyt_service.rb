class NytService

  include HTTParty
  base_uri 'http://api.nytimes.com/svc/search/v2/articlesearch'

  def initialize
    @options = { apikey: ENV["nyt_api_key"]}
  end
end
