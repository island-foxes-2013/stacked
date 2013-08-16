require 'spec_helper'

describe CardsController do
	describe "GET #index" do
		it "responds successfully with an HTTP 200 status code" do
			get :index
			expect(response).to be_success
			expect(response.status).to eq(200)
		end
	end

	describe "gets cards#new" do
		it "should get a response fron new route" do
			pending
			get :new
			expect(response.status).to eq(200)
		end
	end

	describe "gets cards#create" do
		it "should get a response from create route" do
			pending
			get :create
			expect(response.status).to eq(200)
		end
	end

end