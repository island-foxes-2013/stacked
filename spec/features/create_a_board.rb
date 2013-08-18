require 'spec_helper'

	#current tests do no require logging in
	describe 'board' do 

		context "creating one board" do

			it "should have a link to create a new board on home page" do
				visit root_path
				page.should have_content('New Board')
			end
	
			it "should have field for name" do
				pending
			end

			it "should have field for description" do
				pending
			end

			it "creates a board" do
    		visit '/boards/new'
      	fill_in 'board_name', :with => 'Cool'
      	fill_in 'board_description', :with => 'This is a cool test board'
    		click_button 'Create'
    		expect(page).to have_content 'Cool'
  		end

		end
		
	end