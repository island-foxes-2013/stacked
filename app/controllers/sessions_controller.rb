class SessionsController < ApplicationController

	def new

	end

	def create
		# ap request.env['omniauth.auth']
		auth = request.env['omniauth.auth']
		ap "*" * 100
		unless @auth = Authorization.find_from_hash(auth)
			# Create a new user or add an auth to existing user, depending on 
			# whether there is already a user signed in 
			ap "Creating a new auth!"
			@auth = Authorization.create_from_hash(auth, current_user)
		end

		# Log the authorizing user in
		self.current_user = @auth.user

		render text: "Welcome, #{current_user.name}... to Jurassic Park."
	end

	def destroy
		session.clear
	end

end