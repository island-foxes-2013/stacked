FactoryGirl.define do 

	factory :authorization do 
		provider "Twitter"
		uid "1234567890"
		user_id "ericchen"
	end

end