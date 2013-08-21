class Post < ActiveRecord::Base
	attr_accessible :updated_epoch, :post_json, :card

	validates_uniqueness_of :post_json

	belongs_to :card
end
