class SessionsController < ApplicationController

	def create
		ap request.env['omniauth.auth']
		render text: request.env['omniauth.auth'].inspect
	end

end
