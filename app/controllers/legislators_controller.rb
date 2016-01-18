class LegislatorsController < ApplicationController
  # include LegislatorsService

  include HTTParty
  base_uri 'https://congress.api.sunlightfoundation.com'


  def search
    @legislators = SunlightService.new#(ENV["sunlight_api_key"])
      .legislators_for_zip(params["zipcode"])
  end

end
