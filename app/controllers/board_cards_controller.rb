class BoardCardsController < ApplicationController
	def create
		board = Board.find_by_slug(params['board_slug'],)
		card = Card.find_by_slug(params['card_slug'])
		board.cards << card
		Board.save
		ap "Adding #{card.name} to #{board.name}!"
		render text: "Success!"
	end
end