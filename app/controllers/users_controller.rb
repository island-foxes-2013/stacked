class UsersController < ApplicationController

	# def update
	# 	@user = current_user if signed_in?
	# end

	def edit
		session[:return_to] = request.referrer
		if signed_in?
			@user = current_user
			# @card = current_user.primary_card
		else
			# TODO: add flash notification
			redirect_to session[:return_to]
		end
	end

end