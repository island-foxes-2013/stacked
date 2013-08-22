require 'spec_helper'

	describe 'CardCache' do

		let(:board) { FactoryGirl.create(:board) }
		let(:card) { FactoryGirl.create(:card) }
	
		describe '.perform' do
			
			before do
				
				card.save
				board.save
				board.cards << card
				visit root_path
				visit '/auth/provider'
			end

		end
	
	end 