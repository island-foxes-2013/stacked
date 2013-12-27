class SessionsController < ApplicationController

	def new

	end

	def create
		auth = request.env['omniauth.auth']

		if auth['provider'] == 'instagram'
			session[:instagram_token] = auth['credentials']['token']
		end
		# debugger
		# if auth['provider'] == 'twitter'
		# 	session[:twitter_client]  = Twitter::Client.new(
  # 			oauth_token: auth['credentials']['token'],
  # 			oauth_token_secret: auth['credentials']['secret']
		# 	)			
		# end
		unless @auth = Authorization.find_from_hash(auth)
			# Create a new user or add an auth to existing user, depending on 
			# whether there is already a user signed in 
			@auth = Authorization.create_from_hash(auth)
		end

		# Log the authorizing user in
		self.current_user = @auth.user

		redirect_to :root
	end

	def destroy
		session.clear
		redirect_to :root
	end

end