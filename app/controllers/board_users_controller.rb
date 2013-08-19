class BoardUsersController < ApplicationController

	def create
		BoardUser.create(user_id: current_user.id, board_id: params[:format])
	end

	def destroy
		board_user = BoardUser.where(board_id: params[:format], user_id: current_user.id).first
		if board
			board_user.destroy
		end
	end

end