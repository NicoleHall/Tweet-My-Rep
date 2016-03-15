ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start 'rails'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'capybara/rails'
require 'webmock/minitest'

class ActiveSupport::TestCase
  include Capybara::DSL

  VCR.configure do |config|
    config.ignore_localhost = true
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
  end

  def generate_five_random_zipcodes
    zipcodes =
     [{postal_code: "17936",
     place_name: "Gordon",
     state: "Pennsylvania",
     state_abbreviation: "PA",
     county: "Schuylkill",
     latitude: "40.7489",
     longitude: "-76.3355"},

    {postal_code: "24527",
     place_name: "Blairs",
     state: "Virginia",
     state_abbreviation: "VA",
     county: "Pittsylvania",
     latitude: "36.7102",
     longitude: "-79.3381"},

     {postal_code: "67024",
     place_name: "Cedar Vale",
     state: "Kansas",
     state_abbreviation: "KS",
     county: "Chautauqua",
     latitude: "37.1265",
     longitude: "-96.4701"},

     {postal_code: "90210",
     place_name: "Beverly Hills",
     state: "California",
     state_abbreviation: "CA",
     county: "Los Angeles",
     latitude: "27.5612",
     longitude: "-68.41"},

     {postal_code: "80205",
     place_name: "Denver",
     state: "Colorado",
     state_abbreviation: "CO",
     county: "Denver",
     latitude: "38.3267",
     longitude: "21.3650"}]

     zipcodes.each {|zip| Zipcode.create(zip)}
  end

end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = TweetMyRep::Application
    stub_omniauth
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      extra: {
        raw_info: {
          user_id: "1234",
          name: "ColeMersich",
          screen_name: "ColeMersich",
        }
      },
      credentials: {
        access_token: "pizza",
        access_token_secret: "cheese pizza",
      }
    })
  end

end
