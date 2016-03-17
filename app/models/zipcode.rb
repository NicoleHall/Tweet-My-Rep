class Zipcode < ActiveRecord::Base

  def self.get_a_random_zip
    self.order("RANDOM()").first
  end

  def self.zipcode_does_not_exist?(zipcode)
    Zipcode.exists?(zipcode) == false
  end
end
