require './test/test_helper'

class TwitterServiceTest < ActiveSupport::TestCase

  attr_reader :service

  def setup
    @service = TwitterService.new(user_with_credentials(
      oauth_token: "public token",
      oauth_token_secret: "secret token",
    ))
  end

  test '#compose_tweet composes a tweet' do
    stub_request(:post, "https://api.twitter.com/1.1/statuses/update.json")
      .with(body: { status: "@tedcruz, are you related to tom cruise?" })
      .to_return(status: 200, body: { id: 1 }.to_json)
    stub_request(:post, "https://api.twitter.com/1.1/statuses/update.json")
      .with(body: { status: "@tedcruz, no seriously, are you related to tom cruise?" })
      .to_return(status: 200, body: { id: 123 }.to_json)

    new_tweet = service.compose_tweet("@tedcruz, are you related to tom cruise?")
    second_new_tweet = service.compose_tweet("@tedcruz, no seriously, are you related to tom cruise?")

    assert_equal new_tweet.id, 1
    assert_equal second_new_tweet.id, 123
  end

  test "#compose_tweet sends the tweet from the correct user" do
    fred = user_with_credentials(oauth_token: "fred", oauth_token_secret: "fred secret")
    bob = user_with_credentials(oauth_token: "bob", oauth_token_secret: "bob secret")

    expect_tweets_to_be_made
    TwitterService.new(fred).compose_tweet("Hello")
    TwitterService.new(bob).compose_tweet("World")

    assert_tweet_made_from(fred, "Hello")
    assert_tweet_made_from(bob, "World")
  end

  private

  def user_with_credentials(oauth_token:, oauth_token_secret:)
    User.new(
      name:               "Cole Mersich",
      screen_name:        "ColeMersich",
      uid:                "250190173",
      oauth_token:        oauth_token,
      oauth_token_secret: oauth_token_secret,
      created_at:         "2016-01-13 21:01:31",
      updated_at:         "2016-01-13 21:01:31",
    )
  end

  def expect_tweets_to_be_made
    stub_request(:post, "https://api.twitter.com/1.1/statuses/update.json")
      .to_return(status: 200, body: { id: 1 }.to_json)
  end

  def assert_tweet_made_from(user, status)
    url = "https://api.twitter.com/1.1/statuses/update.json"
    assert_requested :post, url, body: { status: status } do |request|
      request.headers["Authorization"].include?(%(oauth_token="#{user.oauth_token}"))
    end
  end
end
