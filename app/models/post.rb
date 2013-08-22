# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  updated_epoch :integer
#  post_json     :text
#  card_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Post < ActiveRecord::Base
	attr_accessible :updated_epoch, :post_json, :card

	belongs_to :card
end
