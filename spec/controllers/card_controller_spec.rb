require 'spec_helper' 

describe CardsController do

	let(:card) { FactoryGirl.create(:card) }

	before :each do 
		card
	end

	it "deletes the card" do 
		expect{ delete :destroy, id: card }.to change(Card,:count).by(-1) 
	end
