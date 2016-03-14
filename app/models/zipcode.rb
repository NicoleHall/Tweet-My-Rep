class Zipcode < ActiveRecord::Base

  def self.get_a_random_zip
    self.order("RANDOM()").first
  end
end
