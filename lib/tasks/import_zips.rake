require 'csv'

namespace :import do
  desc "Import zipcode data from csv"
  task zipcodes: :environment do

    filename = "#{Rails.root}/lib/assets/zips.csv"

    counter = 0
    CSV.foreach(filename) do |row|
      postal_code, place_name, state, state_abbreviation, county, latitude, longitude = row
      zipcode = Zipcode.create(
        postal_code: postal_code,
        place_name: place_name,
        state: state,
        state_abbreviation: state_abbreviation,
        county: county,
        latitude: latitude,
        longitude: longitude
        )
      counter += 1 if zipcode.persisted?
    end

    puts "Imported #{counter} zipcodes"
  end
end
