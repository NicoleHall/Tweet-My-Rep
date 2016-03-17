class LegislatorsController < ApplicationController

  def search
    zipcode = params["zipcode"]
    redirect_to root_path unless current_user && zipcode

    if Zipcode.zipcode_does_not_exist?(zipcode)
      @legislators = []
    else
      @legislators = SunlightService.legislators_by_long_lat_from_zip(zipcode)
    end
  end

end
