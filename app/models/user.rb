# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  email        :string(255)
#  slug         :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  primary_card :integer
#



class User < ActiveRecord::Base

	extend FriendlyId	
	friendly_id :name, :use => :slugged

	attr_accessible :name, :username

  validates_presence_of :name

  has_many :authorizations
  has_many :boards
  has_many :cards
  has_one :primary_card, class_name: "Card"

  has_many :board_users
  has_many :boards_following, :through => :board_users, :source => :board

  def self.create_from_hash!(hash)
  	create(name: hash['info']['name'])
  end

  def avatar_url
    
    auth = authorizations.find_by_provider('twitter')
    if auth
      "http://res.cloudinary.com/demo/image/twitter_name/w_45,h_45,c_fill/#{auth.nickname}.jpg"
    else
      # TODO: use asset(s)_path instead. Maybe take asset_path as an argument if you don't have access to it?
      'default_user.png'
    end
  end

  def create_primary_card

    prim_card = Card.new(name: name)

    twitter_auth = self.authorizations.find_by_provider('twitter')
    instagram_auth = self.authorizations.find_by_provider('instagram')
    tumblr_auth = self.authorizations.find_by_provider('tumblr')

    prim_card.twitter_handle = twitter_auth.nickname if twitter_auth
    prim_card.instagram_handle = instagram_auth.nickname if instagram_auth
    prim_card.tumblr_handle = tumblr_auth.nickname if tumblr_auth

    prim_card.save
    self.primary_card = prim_card
  end

  def follows_board?(board)
    board_users.where(board_id: board).any?
  end

  def board_user_for(board)
    board_users.find_by_board_id(board.id)
  end

end
