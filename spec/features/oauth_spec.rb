require 'spec_helper'

describe 'Twitter OAuth' do

	before(:each) do 
	  # request.env["devise.mapping"] = Devise.mappings[:user] 
	  # request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] 
	  visit root_path
	  visit 'auth/twitter'
	end

	it "should log you in through Twitter" do	
		page.should have_content('Daniel Willems')
	end

	it "twitter sign in button should lead to twitter authentication page" do
    Authorization.last.uid.should == '1337'
  end

  it "should log a user out on click of logout button" do 
  	click_link "Log Out"
  	page.should have_content("Log In or Sign Up!")
  end
 
end

describe 'Instagram OAuth' do

	before do
	  visit root_path
	end

	it 'should log you in through Instagram' do
		visit 'auth/instagram'
	end

end
