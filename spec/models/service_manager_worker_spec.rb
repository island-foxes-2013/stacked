require 'spec_helper'

	describe ServiceManagerWorker do

		let(:card) { FactoryGirl.create(:card) }
				
		describe '.perform' do
			
			before do
				card
			end

			it "responds with 200" do
				ServiceManagerWorker.perform_async(card.id) 
				
				# expect(response.status).to eql(200)
			end

				
			# context 'it updates posts if empty' do
	
			# 	# posts = JSON.parse response.body
			# 	# posts.first["provider"].should eq "santa_clause"
			# 	# posts.last["provider"].should eq "easter_bunny"
			# 	it { should be_a CardCacheRefreshWorker }
			# end

		end
	
	end 