class BoardsController < ApplicationController

	def index
		@boards = Board.order('created_at DESC').limit(10)
	end

	def remove_card
		
	end

end
