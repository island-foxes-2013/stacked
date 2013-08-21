require 'spec_helper' 

describe BoardsController do

	let(:board) { FactoryGirl.create(:board) }

	before :each do 
		card
	end

	# it "deletes the card" do 
	# 	expect{ delete :destroy, id: card }.to change(Card,:count).by(-1) 
	# end

end
