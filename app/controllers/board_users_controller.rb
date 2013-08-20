class BoardUsersController < ApplicationController

	def create
		board = Board.find(params[:board_id])
		current_user.boards_following << board
		render partial: 'boards/follow_or_unfollow_board_link', locals: { board: board }
	end

	def destroy
		board_user = current_user.board_users.find(params[:id])
		if board_user
			board_user.destroy
			render partial: 'boards/follow_or_unfollow_board_link', locals: { board: board_user.board }
		end
	end

end