class BoardCardsController < ApplicationController
	def create
		board = Board.find_by_slug(params['board_slug'],)
		card = Card.find_by_slug(params['card_slug'])
		board.cards << card
		Board.save
		render text: "Success!"
	end
end