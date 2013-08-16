require 'spec_helper'

describe 'Twitter OAuth' do

	before(:each) do 
	  # request.env["devise.mapping"] = Devise.mappings[:user] 
	  # request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] 
	  visit root_path
	end

	it "should log you in through Twitter" do	
		click_link('Log In or Sign Up!')
		page.should have_content('Daniel Willems')
	end

	it "twitter sign in button should lead to twitter authentication page" do
    click_link "Log In or Sign Up!"
    Authorization.last.uid.should == '1337'
  end

  it "should log a user out on click of logout button" do 
  	click_link "Log In or Sign Up!"
  	click_link "Log Out"
  	page.should have_content("Log In or Sign Up!")
  end
 
	end