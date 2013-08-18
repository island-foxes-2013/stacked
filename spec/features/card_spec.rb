require 'spec_helper'

	#current tests do no require logging in
	#tests also require visiting the cards/* route
	describe 'card' do 

		context "verify content on create card page" do
			
			before [:all] do
				visit root_path
				visit 'cards/new'
			end

			it "should have a link to create a new board on home page" do
				page.should have_content('New Card')
			end
	
			it "should have field for Twitter" do
				page.should have_content('Twitter handle')
			end

			it "should have field for Instagram" do
				page.should have_content('Instagram handle')
			end

		end

		context "creating a card" do

			# before [:each] do
			# 	visit root_path
			# 	visit 'cards/new'
			# end

			# it "creates a card w" do
   #    	fill_in 'board_name', :with => 'Cool'
   #    	fill_in 'board_description', :with => 'This is a cool test board'
   #  		click_button 'Create'
   #  		expect(page).to have_content 'Cool'
  	# 	end

  	# 	it "fails at creating board without name" do
  	# 		visit '/boards/new'
   #    	fill_in 'board_description', :with => 'This is not a cool test board'
   #  		click_button 'Create'
   #  		# expect(page).to have_content 'Create Board'
   #  		find_button('Create Board').visible?
  	# 	end


		end

	end