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
	
			it "can find board" do
				pending 'need to get this in the right search bar'
				first(:css, "input[id$='q']").set("Cool")
				click_button('Search')
				page.should have_content('Cool')
			end

		end

		context "find a card" do
	
			# before do
			# 	visit root_path
			# 	visit 'cards/new'
			# 	fill_in 'card_twitter_handle', :with => 'dmkwillems'
   #    	fill_in 'card_instagram_handle', :with => 'danielwillems'
   #  		click_button 'Create Card'
   #  	end

			# it 'can find card', :js => true do
			# 	first(:css, "input[id$='q']").set("Daniel")
			# 	click_button('Search')
			# 	page.should have_content('Daniel')
			# end
	
		end

	end 


