class NytService
  include HTTParty
  base_uri 'http://api.nytimes.com'

  ARTICLE_LIMIT = 3

  def initialize
    @options = { "api-key" => ENV["article_search_api_key"] }
  end

  # def search_articles(legislator)
  #   response = self.class.get("/svc/search/v2/articlesearch.json",
  #              query: @options.merge(q: legislator.full_name) )
  #   parse_articles(response)
  # end

  # private
  # def parse_articles(response)
  #   three_articles = response.parsed_response["response"]["docs"].take(ARTICLE_LIMIT).map do |article_hash|
  #     article_hash.slice("web_url", "snippet", "pub_date")
  #   end
  #   three_articles.sort_by do |article|
  #     article["pub_date"].to_datetime
  #   end.reverse
  # end

end
