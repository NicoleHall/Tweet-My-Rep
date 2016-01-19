class LegislatorsController < ApplicationController

  def search
    # Decorator pattern
    #   * SimpleDelegator
    # @presenter = LegislatorsPresenter.new(params["zipcode"])
    @legislators = SunlightService.new.legislators_for_zip(params["zipcode"])
  end

end
