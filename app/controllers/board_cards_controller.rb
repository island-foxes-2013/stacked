class BoardCardsController < ApplicationController
	def create
		board = Board.find_by_slug(params['board_slug'],)
		card = Card.find_by_slug(params['card_slug'])
		board.cards << card
		Board.save
		render text: "Success!"
	end

	def destroy
		kill_me = BoardCard.where(board_id: params[:format], card_id: params[:id]).first
		kill_me.destroy if kill_me
	end
end