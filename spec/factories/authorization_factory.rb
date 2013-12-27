# == Schema Information
#
# Table name: authorizations
#
#  id           :integer          not null, primary key
#  provider     :string(255)
#  uid          :string(255)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  nickname     :string(255)
#  oauth_token  :string(255)
#  oauth_secret :string(255)
#

FactoryGirl.define do 

	factory :authorization do 
		provider "Twitter"
		uid "1234567890"
		user
	end

end
