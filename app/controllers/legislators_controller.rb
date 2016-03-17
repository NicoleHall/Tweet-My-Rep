class LegislatorsController < ApplicationController

  def search
    redirect_to root_path unless current_user && params["zipcode"]
    # @legislators = SunlightService.legislators_for_zip(params["zipcode"])
    @legislators = SunlightService.legislators_by_long_lat_from_zip(params["zipcode"])
  end

end
