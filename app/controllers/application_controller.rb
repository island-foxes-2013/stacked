class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :print_params

  def current_user
  	@current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
  	!!current_user
  end

  helper_method :current_user, :signed_in?

  def current_user=(user)
  	@current_user = user
  	session[:user_id] = user.id
  end

  def twitter_credentials=(credentials)
    ENV['TWITTER_OAUTH_TOKEN']
    ENV['TWITTER_OAUTH_TOKEN_SECRET']
  end

  def twitter_credentials
    {twitter_oauth_token: ENV['TWITTER_OAUTH_TOKEN'],
     twitter_oauth_token_secret: ENV['TWITTER_OAUTH_TOKEN_SECRET']}
  end

	private

  def print_params
  	ap params
  end
end
