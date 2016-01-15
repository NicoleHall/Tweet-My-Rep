class TweetsController < ApplicationController

  def new
  end

  def create
    @new_tweet = service.compose_tweet(twitter_params[:message])
  end

  private
  def service
    @service ||= TwitterService.new(current_user)
  end

  def twitter_params
    params.require(:tweet).permit(:message)
  end
end
