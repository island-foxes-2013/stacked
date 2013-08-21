require 'spec_helper' 

module BoardHelper

end

class FakeBoardHelper
	include BoardHelper
	include Rails.application.routes.url_helpers 
end


describe BoardHelper do
	include Rails.application.routes.url_helpers 
	describe ".follow_link" do 
		let(:user) { FactoryGirl.create(:user) }
		let(:board) { FactoryGirl.create(:board) }
		let(:board_helper) { FakeBoardHelper.new }
		
		let(:link) { board_helper.follow_link(user, board) }

		before { board_helper.stub(:link_to).and_return("A link") }
		it "returns the results of link_to" do
			link.should eq "A link"
		end

		context "when the user already follows the board" do
			before { user.boards_following << board }
			it "links to unfollow the board" do
				link
				expect(board_helper).to have_received(:link_to).with("Unfollow", board_user_path(user.board_user_for(board)), method: :delete, remote: true, class: 'unfollow')
			end
		end

		context "when the user does not follow the board" do
			it "links to follow the board" do
				link
				expect(board_helper).to have_received(:link_to).with("Follow", board_board_users_path(board), method: :post, remote: true, class: 'follow')
			end
		end
		
	end

end