require './test/test_helper'

class TwitterServiceTest < ActiveSupport::TestCase

  attr_reader :service

  def setup
    @service = TwitterService.new(User.new(
      name:               "Cole Mersich",
      screen_name:        "ColeMersich",
      uid:                "250190173",
      oauth_token:        ENV["oauth_token"],
      oauth_token_secret: ENV["oauth_token_secret"],
      created_at:         "2016-01-13 21:01:31",
      updated_at:         "2016-01-13 21:01:31")
      )
  end


  test '#compose_tweet' do
    VCR.use_cassette('tweets#create') do
#what's going on here??  service holds the user details, but
#I'm getting "Twitter::Error::Unauthorized: Could not authenticate you."
      new_tweet = service.compose_tweet("@tedcruz, are you related to tom cruise?")

      assert_equal "", current_path
    end
  end
end
