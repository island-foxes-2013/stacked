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

	it "responds 302 (redirect to @board) on valid from create" do 
		post :create, board: FactoryGirl.attributes_for(:board)
		expect(response.status).to eq(302)
	end

	it "responds 200 from edit" do 
		get :edit, id: board.id
		expect(response.status).to eq(200)
	end

	it "responds 302 (redirect to @board) from update" do 
		post :update, id: board.id
		expect(response.status).to eq(302)
	end

	#something wrong with how data is passed
	# it "fails to update with improper data" do 
	# 	pending
	# 	fake = Board.stub(:id) { 1 }
	# 	post :update, id: fake.id
	# 	expect(response.status).to eq(404)
	# end

	# it "responds 200 from destroy" do 
	# 	delete :destory, board: FactoryGirl.attributes_for(:board)
	# 	expect(response.status).to eq(200)
	# end

end
