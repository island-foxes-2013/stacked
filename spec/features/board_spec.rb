require 'spec_helper'

	#current tests do no require logging in
	describe 'board' do 

		context "creating one board" do

			let(:board) { FactoryGirl.create(:board) }
				
			before [:each] do
				visit root_path
			end

			it "should have a link to create a new board on home page" do
				page.should have_content('New Board')
			end
	
			it "should have field for name" do
				page.should have_content('Name')
			end

			it "should have field for description" do
				page.should have_content('Description')
			end

			it "creates a board" do
    		visit '/boards/new'
      	fill_in 'board_name', :with => 'Cool'
      	fill_in 'board_description', :with => 'This is a cool test board'
    		click_button 'Create'
    		expect(page).to have_content 'Cool'
  		end

  		it "fails at creating board without name" do
  			visit '/boards/new'
      	fill_in 'board_description', :with => 'This is not a cool test board'
    		click_button 'Create'
    		find_button('Create Board').visible?
  		end

		end

		context "editing a board" do 

			before [:each] do
				visit '/boards/new'
      	fill_in 'board_name', :with => 'Cool'
      	fill_in 'board_description', :with => 'This is a cool test board'
    		click_button 'Create'
			end

			it "should see edit name" do
				page.should have_content('Name')
			end

			it "should see edit description" do
				page.should have_content('Description')
			end

			it "should edit board name and description" do
				fill_in 'board_name', :with => 'Very Cool'
      	fill_in 'board_description', :with => 'Even more better'
    		click_button 'Update Board'
    		page.should have_content('Very Cool')
    	end

    	it "should not edit board name with blank name" do
				fill_in 'board_name', :with => ''
      	fill_in 'board_description', :with => 'Even more better'
    		click_button 'Update Board'
    		page.should have_content('Edit Board')
    	end

		end

		context "destory board" do

			let(:board) { FactoryGirl.create(:board) }

    		it "should destroy board" do
    			board
    			visit root_path
    			click_link('Destroy')
    			# this is not testing to see that is works.  It is just clicking the button.
    			# page.driver.browser.switch_to.alert.accept
    			# page.should have_no_content('Destroy')
    		end

		end

	end
