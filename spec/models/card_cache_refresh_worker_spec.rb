require 'spec_helper'

	describe CardCacheRefreshWorker do

		let(:card) { FactoryGirl.create(:card) }
				
		describe '.perform' do
			
			before do
				card
				# ServiceManager.stub(:get_posts).with(card).and_return([
				# {provider: "santa_clause", created: DateTime.now},
				# {provider: "easter_bunny", created: DateTime.now}
				# ])
			end

			it "responds with 200" do
				pending 'need HELP'
				CardCacheRefreshWorker.perform_async(card.id) 
				expect(response.status).to eql(200)
			end

				
			# context 'it updates posts if empty' do
	
			# 	# posts = JSON.parse response.body
			# 	# posts.first["provider"].should eq "santa_clause"
			# 	# posts.last["provider"].should eq "easter_bunny"
			# 	it { should be_a CardCacheRefreshWorker }
			# end

		end
	
	end 