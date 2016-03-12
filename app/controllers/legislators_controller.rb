class LegislatorsController < ApplicationController

  def search
    @legislators = SunlightService.new.legislators_for_zip(params["zipcode"])

  end

end
