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
			pending 'could be a bug on the board_users controller (Clint doesnt think so)'
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
			request.env["rack.session"] = { user_id: user.id }
			# post :create, board_id: board.id
			BoardUser.create(user_id: user.id, board_id: board.id)
		  ap BoardUser.all
		  ap Board.all
		}
	
	it "deletes the board user" do 
		pending 'waiting on Zee'
		expect {
				delete :destory, board_id: board.id
			}.to change(BoardUser,:count).by(-1) 
	end

	end
end




# class BoardUsersController < ApplicationController
# 1  def create
#     BoardUser.create(user_id: current_user.id, board_id: params[:format])
#   end
# 1  def destroy
#     board_user = BoardUser.where(board_id: params[:id], user_id: current_user.id).first
#     if board_user
#       board_user.destroy
#     end
#   end
#  end