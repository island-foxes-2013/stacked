require 'spec_helper'

	describe ServiceManagerWorker do

		let(:card) { FactoryGirl.create(:card) }
		let(:user) { FactoryGirl.create(:user) }
		let(:authorization) { create(:authorization) }
		let(:auth_hash) { { 'provider'=> "Twitter", 'uid'=> '1234567890', 'info'=>{ 'name'=>"Eric Chen" } } }
		
				
		describe '.perform' do
			
			before [:each] do
				card
			end

			it "responds with 200" do
				expect {
  				ServiceManagerWorker.perform_async(card.id)
				}.to change(ServiceManagerWorker.jobs, :size).by(1)
			end

			before do 
      	create(:authorization)
    	end	

			it 'performs' do

				user
				Authorization.find_from_hash(auth_hash)
				card.user_id = 1
				card.save
				
				# Authorization.find_from_hash(auth_hash)
				worker = ServiceManagerWorker.new
				expect { worker.perform(card)}.to raise_error
			end
			# context 'it updates posts if empty' do
	
			# 	# posts = JSON.parse response.body
			# 	# posts.first["provider"].should eq "santa_clause"
			# 	# posts.last["provider"].should eq "easter_bunny"
			# 	it { should be_a CardCacheRefreshWorker }
			# end

		end
	
	end 