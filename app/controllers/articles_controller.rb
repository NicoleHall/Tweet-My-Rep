class ArticlesController < ApplicationController

  def search
    @articles = "http://api.nytimes.com/svc/search/v2/articlesearch.json?q=#{Legislator.last_name}&api-key=174a1ee32de36322b246700bfa57630c:0:74036157"

  end


end
