# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  email        :string(255)
#  username     :string(255)
#  slug         :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  primary_card :integer
#



FactoryGirl.define do 

	factory :user do 
		name "Eric Chen"
	end

end
