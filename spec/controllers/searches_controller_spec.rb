require 'spec_helper'

#We could make this more specific or just do this in intergration tests

describe SearchesController do

let(:card) { FactoryGirl.create(:card) }

	before [:each] do
		card
	end

	describe '#index' do
		it "returns user results " do
			get :index, q: 'Daniel'
			response.should be_ok
		end

	# 	it "returns twitter results " do
	# 		get :index, q: ''
	# 		@cards_results == 'dmkwillems'
	# 	end
	
	# 	it "returns instagram results " do
	# 		get :index, q: 'danielwillems'
	# 	end
	end

	describe '#global' do
		it "returns user results " do
			get :global, q: 'Daniel'
			response.should be_ok
		end

		# it "returns twitter results" do
		# 	get :global, q: 'dmkwillems'
		# end

		# it "returns instagram results " do
		# 	get :global, q: 'danielwillems'
		# end

	end
end

# expect {
# 				post :create, board_slug: board.slug, card_slug: card.slug
# 			}.to change(BoardCard,:count).by(1) 