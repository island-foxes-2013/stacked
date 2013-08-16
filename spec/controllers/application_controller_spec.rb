# require 'spec_helper'

# describe ApplicationController do

# 	let(:user) { create(:user) }

# 	describe ".current_user=" do 
# 		context "when passed a user" do
# 			before do 
# 				subject.current_user = user
# 			end
# 			it "should set session[:user_id] to that user's id" do
# 				expect { subject.session[:user_id] }.to eq user.id
# 			end
# 		end

# 		context "when passed nil" do
# 			before do 
# 				subject.current_user = user
# 			end
# 			it "should clear session[:user_id]" do
# 				expect { subject.session[:user_id] }.not_to be
# 			end
# 		end
# 	end

# 	describe ".current_user" do 
# 		before do 
# 			current_user = user
# 		end

# 		subject { current_user }

# 		it { should be_a User }
# 	end
# end