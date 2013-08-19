# == Schema Information
#
# Table name: board_users
#
#  id         :integer          not null, primary key
#  board_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BoardUser < ActiveRecord::Base
	attr_accessible :board_id, :user_id
	validates_uniqueness_of :board_id, scope: :user_id

	belongs_to :board
	belongs_to :user

end
