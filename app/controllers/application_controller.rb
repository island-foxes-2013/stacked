class ApplicationController < ActionController::Base

  protect_from_forgery
  
  # def search_results
  #   @search_results = {type: 'Board'}
  # end

  def current_user
  	@current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
  	!!current_user
  end

  helper_method :current_user, :signed_in?, :instagram_token, :current_user=

  def current_user=(user)
    session[:user_id] = user.id
  	@current_user = user
  end

  # def instagram_token
  #   session[:instagram_token] ||= ENV['INSTAGRAM_TOKEN']
  # end

  # def twitter_token
  #   session[:twitter_token] ||= ENV['TWITTER_TOKEN']
  # end
	
end
