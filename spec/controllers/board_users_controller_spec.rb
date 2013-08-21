require 'spec_helper' 

describe BoardUsersController do

	let(:board) { FactoryGirl.create(:board) }
	let(:user) { FactoryGirl.create(:user) }

	before :each do 
		board
		user
	end

	describe "#create" do
		before {
			request.env["rack.session"] = { user_id: user.id } 	
		}
		
		it "creates a board user" do
			expect {
				post :create, board_id: board.id
			}.to change(BoardUser,:count).by(1) 
		end

		it "ties the boarduser to the right board" do
			post :create, board_id: board.id
			BoardUser.last.board.should eq board
		end

		it "ties the boarduser to the right user" do
			post :create, board_id: board.id
			BoardUser.last.user.should eq user
		end
	end


	describe "#destroy" do
		before {
			user
			board
			board.user_id = user.id
			request.env["rack.session"] = { user_id: user.id }
			BoardUser.create(user_id: user.id, board_id: board.id)
		}
	
	it "deletes the board user" do
		expect {
				delete :destroy, id: BoardUser.last.id
			}.to change(BoardUser,:count).by(-1) 
	end

	end
end