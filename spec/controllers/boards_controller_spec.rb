require 'spec_helper' 

describe BoardsController do

	let(:board) { FactoryGirl.create(:board) }
	let(:user) { FactoryGirl.create(:user) }

	before :each do 
		board
		user
		request.env["rack.session"] = { user_id: user.id }
	end

	it "responds 200 from index" do 
		get :index
		expect(response.status).to eq(200)
	end

	it "responds 200 from show" do 
		get :show, id: board.id
		expect(response.status).to eq(200)
	end

	it "responds 200 from new" do 
		get :new, id: user.id
		expect(response.status).to eq(200)
	end

	it "redirects and responds 200 from create when it doesn't save" do 
		post :create, id: board.id
		expect(response.status).to eq(200)
	end

	it "redirects to @board on successful create and responds 200 from create" do 
		new_board = Board.new(name: "Test")
		ap new_board
		ap current_user
		post :create, id: new_board.id
		expect(response.status).to eq(200)
	end

	it "responds 200 from edit" do 
		get :edit, id: board.id
		expect(response.status).to eq(200)
	end

	it "responds 302 (redirect to @board) from update" do 
		post :update, id: board.id
		expect(response.status).to eq(302)
	end

	it "fails to update with improper data" do 
		board.stub(:name) { ""}
		post :update, id: board.id
		expect(response.status).to eq(302)
	end

	it "responds 200 from destroy" do 
		pending 'broken'
		delete :destory#, id: board.id
		expect(response.status).to eq(200)
	end

end
