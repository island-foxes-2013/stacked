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

  helper_method :current_user, :signed_in?, :instagram_token

  def current_user=(user)
  	@current_user = user
  	session[:user_id] = user.id
  end

  def instagram_token
    session[:instagram_token] ||= ENV['INSTAGRAM_TOKEN']
  end
	
end
