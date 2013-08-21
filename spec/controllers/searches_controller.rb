require 'spec_helper'

describe SearchesController do

	describe '#index' do
		it "returns user results " do
			get :index
		end

		it "returns twitter results " do
			get :index
		end
	
		it "returns instagram results " do
			get :index
		end
	end

	describe '#global' do
		it "returns user results " do
			get :global
		end

		it "returns twitter results " do
			get :global
		end

		it "returns instagram results " do
			get :global
		end

	end
end