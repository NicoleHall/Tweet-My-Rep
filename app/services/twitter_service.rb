class TwitterService
  def initialize(user)
    @user ||= user
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["consumer_key"]
      config.consumer_secret     = ENV["consumer_secret"]
      config.access_token        = user.oauth_token
      config.access_token_secret = user.oauth_token_secret
    end
  end

  def compose_tweet(text)
    @client.update(text)
  end

  private
  attr_reader :client
end
