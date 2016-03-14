class RandomZipcodesController < ApplicationController


  def index
    @random_zip = Zipcode.get_a_random_zip
      #  require 'pry'; binding.pry
  end
end
