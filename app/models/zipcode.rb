class Zipcode < ActiveRecord::Base

  def self.get_a_random_zip
    self.order("RANDOM()").first
  end

  def self.zipcode_does_not_exist?(zipcode)
    Zipcode.find_by(postal_code: zipcode) == nil
  end
end
