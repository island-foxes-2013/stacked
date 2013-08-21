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
			pending 'fixing'
			ServiceManager.stub(:get_posts).with(card).and_return([
				{provider: "santa_clause", created: DateTime.now},
				{provider: "easter_bunny", created: DateTime.now}
			])
			get  :get_posts, id: card.slug
			posts = JSON.parse response.body
			posts.first["provider"].should eq "santa_clause"
			posts.last["provider"].should eq "easter_bunny"
		end
	end

end
