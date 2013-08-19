require 'spec_helper'

	describe 'search' do

		let(:board) { FactoryGirl.create(:board) }
		let(:card) { FactoryGirl.create(:card) }

		before [:each] do
			visit root_path
		end

		context "can find board" do
			board
		end

		context 'can find card' do
			card
		end
	end 

end