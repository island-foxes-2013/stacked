require 'spec_helper'

	describe 'search' do

		let(:board) { FactoryGirl.create(:board) }
		let(:card) { FactoryGirl.create(:card) }

		context 'find a board' do

			before do
				pending 'fixing'
				visit root_path
				visit '/boards/new'
    	  fill_in 'board_name', :with => 'Cool'
    	  fill_in 'board_description', :with => 'This is a cool test board'
    		click_button 'Create'
				visit root_path
				visit '/search'
			end

		end

		context "find a card" do
	
		end

	end 


