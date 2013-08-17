class UsersController < ApplicationController

	def update
		@user = current_user if signed_in?
	end

end