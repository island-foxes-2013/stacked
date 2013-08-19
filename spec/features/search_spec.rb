require 'spec_helper'

	describe 'search' do

		let(:board) { FactoryGirl.create(:board) }
		let(:card) { FactoryGirl.create(:card) }

		before [:each] do
			FactoryGirl.create(:board) 
			visit root_path
			visit '/search'
		end

		it "can find board", :js => true do
			first(:css, "input[id$='q']").set("Cool")
			click_button('Search')
			page.should have_content('Cool')
		end

		it 'can find card' do
			card
			first(:css, "input[id$='q']").set("Daniel")
			click_button('Search')
			page.should have_content('Daniel')
		end
	
	end 


