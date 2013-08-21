require 'spec_helper'

describe BoardCardsController do

	let(:board) { FactoryGirl.create(:board) }
	let(:card) { FactoryGirl.create(:card) }

	describe "#create" do

		before [:each] do
			board
			card
		end

		it "board card relationship should be created" do
			expect {
				post :create, board_slug: board.slug, card_slug: card.slug
			}.to change(BoardCard,:count).by(1) 
		end
		
	end

	before do
		card
		board.cards << card
		# ap board.cards
	end
		
	describe "#destroy" do
		it "board card relationship should be destroy" do
			pending "this is so wrong.  passing test but doesn't hit route."
			expect {
				delete :destroy, card_id: card.id, board_id: board.id
			}.to raise_error
		end
	end

end