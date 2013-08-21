# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  email        :string(255)
#  username     :string(255)
#  slug         :string(255)      not null
#  primary_card :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ActiveRecord::Base

	extend FriendlyId	
	friendly_id :name, :use => :slugged

	attr_accessible :name, :username

  validates_presence_of :name

  has_many :authorizations
  has_many :boards
  has_many :cards

  has_many :board_users
  has_many :boards_following, :through => :board_users, :source => :board

  def self.create_from_hash!(hash)
  	create(name: hash['info']['name'], username: hash['info']['nickname'])
  end

  def follows_board?(board)
    board_users.where(board_id: board).any?
  end

  def board_user_for(board)
    board_users.find_by_board_id(board.id)
  end
end
