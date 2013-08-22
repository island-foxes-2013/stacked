module BoardHelper

	def follow_link(user, board)
		if user.follows_board?(board)
			link_to "Unfollow", board_user_path(user.board_user_for(board)), method: :delete, remote: true, class: 'unfollow'
		else
			link_to 'Follow', board_board_users_path(board), method: :post, remote: true, class: 'follow'
		end		 
	end
end
