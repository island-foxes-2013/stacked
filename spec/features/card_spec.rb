require 'spec_helper'

	#current tests do no require logging in
	#tests also require visiting the cards/* route
	describe 'card' do 

		context 'view all cards on one page' do
			#not sure we want this.  test just visit cards index page
			it "should contain the .all_cards class on page" do
				visit root_path
				visit 'cards'
				find('.all_cards')['class']
			end
		end


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

			before [:each] do
				visit root_path
				visit 'cards/new'
			end

			it "creates with both Twitter and Instagram" do
      	fill_in 'card_twitter_handle', :with => 'dmkwillems'
      	fill_in 'card_instagram_handle', :with => 'danielwillems'
    		click_button 'Create Card'
    		expect(page).to have_content 'dmkwillems'
  		end

  		it "creates with only Twitter" do
  		  pending 'Instagram is throwing an error'
      	fill_in 'card_twitter_handle', :with => 'dmkwillems'
    		click_button 'Create Card'
    		expect(page).to have_content 'dmkwillems'
  		end

  		it "fails without Twitter" do
  			pending 'Instagram is throwing an error'
    		click_button 'Create Card'
    		find_button('Create Card').visible?
  		end

		end

		context "editing, deleting, updating cards" do

			let(:card) { FactoryGirl.create(:card) }

			before [:each] do
				visit root_path
				card		
				visit 'cards/daniel-willems/edit'
			end

			it 'should have content on create path' do
				
				expect(page).to have_content 'Edit Card'
			end

			it 'should be able to update attributes on card with valid data' do
				pending
				# visit 'cards/daniel-willems'

			end

			it 'should have content on delete path' do
				pending 'until we have the right UI'
			end

		end


	end