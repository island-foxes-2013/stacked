require 'spec_helper'

#We could make this more specific or just do this in intergration tests

describe SearchesController do

let(:card) { FactoryGirl.create(:card) }

	before [:each] do
		card
	end

	describe '#index' do
		it "returns user results " do
			get :index, q: 'Daniel'
			response.should be_ok
		end
	end

	describe '#global' do
		it "returns user results " do
			get :global, q: 'Daniel'
			response.should be_ok
		end
	end
end