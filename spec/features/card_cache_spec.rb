require 'spec_helper'

	describe 'CardCache' do

		let(:board) { FactoryGirl.create(:board) }
		let(:card) { FactoryGirl.create(:card) }
	
		describe '.perform' do
			
			before do
				
				# request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
				card.save
				board.save
				board.cards << card
				visit root_path
				visit '/auth/provider'
			end

			# it 'refreshes tweets', :js => true do
			# 	visit "/boards/#{board.slug}"
			# 	# debugger
			# 	visit root_path
			# 	card.save
			# 	board.save
			# 	board.cards << card
			# 	visit root_pathrspe
			# 	# visit root_path
			# 	# debugger
			# 	visit "/boards/#{board.slug}"
			# 	debugger
			# 	sleep 3
			# end 

		
		end
	
	end 