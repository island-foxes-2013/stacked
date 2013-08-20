class BoardUsersController < ApplicationController

	def create
		ap params
		BoardUser.create(user_id: current_user.id, board_id: params[:format])

	end

	def destroy
		board_user = BoardUser.where(board_id: params[:id], user_id: current_user.id).first
		if board_user
			board_user.destroy
		end
	end

end