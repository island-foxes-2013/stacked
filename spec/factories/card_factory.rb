# == Schema Information
#
# Table name: cards
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  twitter_handle   :string(255)
#  instagram_handle :string(255)
#  instagram_id     :string(255)
#  tumblr_handle    :string(255)
#  slug             :string(255)      not null
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do 

	factory :card do 
		name "Daniel Willems"
		twitter_handle 'dmkwillems'
		instagram_handle 'danielwillems'
	end

end
