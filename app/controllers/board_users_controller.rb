class BoardUsersController < ApplicationController

	def create
		BoardUser.create(user_id: current_user.id, board_id: params[:format])
	end

	def destroy
		# board_user = BoardUser.where()
	end

end