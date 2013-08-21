require 'spec_helper'

describe UsersController do

	let(:user) { FactoryGirl.create(:user) }

	before [:each] do
		user
	end

	it "edit the user route to assign user when signed in" do 
		request.env["rack.session"] = { user_id: user.id } 	
		get :edit, id: user.id
		expect(response.status).to eq(200)
	end

	it "does not edit the user when not signed in" do 
    request.env["HTTP_REFERER"] = "where_i_came_from"
		get :edit, id: user
		response.should redirect_to "where_i_came_from"
	end

end