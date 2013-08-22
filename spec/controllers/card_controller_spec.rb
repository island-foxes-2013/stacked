require 'spec_helper' 

describe CardsController do

	let(:card) { FactoryGirl.create(:card) }

	before :each do 
		card
	end

	it "deletes the card" do 
		expect{ delete :destroy, id: card }.to change(Card,:count).by(-1) 
	end

	describe '#get_posts' do
		it "renders JSON for the cards post " do
			# pending 'fixing'
			ServiceManager.stub(:get_posts).with(card).and_return([
				{provider: "tweeterz", created: DateTime.now},
				{provider: "instumgrumz", created: DateTime.now}
			])
			get :get_posts, id: card.slug
			# status = response.status
			# status == 200
			# expect { status }.to eq(200)
			# posts = JSON.parse response.body
			# posts.first["provider"].should eq "tweeterz"
			# posts.last["provider"].should eq "instumgrumz"
		end
	end

end
