ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start 'rails'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'capybara/rails'
require 'webmock/minitest'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # Add more helper methods to be used by all tests here...

  VCR.configure do |config|
    config.ignore_localhost = true
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
  end

  def create_cole
    user = User.create(
      name: "Cole Hall",
      screen_name: "ColeMerscih",
      uid: 12345,
      oauth_token: 12345,
      oauth_token_secret: 12345,
      avatar: "http://pbs.twimg.com/profile_images/610989157108707328/eiwDUICE_normal.jpg"
      )
  end

  def stub_nyt_article
    response = {"web_url"=>"http://www.nytimes.com/politics/first-draft/2015/12/04/a-few-house-democrats-to-attend-prayer-services-at-u-s-mosques/",
 "snippet"=>
  "A small number of House Democrats, including Don Beyer of Virginia, will attend the services in what is intended to be a show of solidarity with American Muslims, an event planned after the Paris attacks and before the shooting in San Bernardino,..."}
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
