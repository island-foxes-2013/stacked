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
      	fill_in 'card_twitter_handle', :with => 'dmkwillems'
    		click_button 'Create Card'
    		expect(page).to have_content 'dmkwillems'
  		end

  		it "fails without Twitter" do
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
      	fill_in 'card_name', :with => 'Eric Chen'
      	click_button 'Update Card'
      	expect(page).to have_content 'Log'
			end

			it 'should return to edit card page with invalid data' do
				fill_in 'card_name', :with => ''
				click_button 'Update Card'
      	expect(page).to have_content 'Edit Card'
			end

		end

	end