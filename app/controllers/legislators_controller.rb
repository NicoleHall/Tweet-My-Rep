class LegislatorsController < ApplicationController
  # include LegislatorsService

  include HTTParty
  base_uri 'https://congress.api.sunlightfoundation.com'


  def search
    @legislators = SunlightService.new.fetch_legislators(params["zipcode"])
  end

end
