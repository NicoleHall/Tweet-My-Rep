class LegislatorsController < ApplicationController

  def search
    redirect_to root_path unless current_user && params["zipcode"]
    @legislators = SunlightService.legislators_for_zip(params["zipcode"])
  end

end
