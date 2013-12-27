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

class Card < ActiveRecord::Base
  extend FriendlyId 
  include CardHelper

  # scope :twitter_oauth_token, -> { user.authorizations.where(provider: "twitter").oauth_token }
  # scope :twitter_oauth_secret, -> { user.authorizations.where(provider: "twitter").oauth_secret }
  # scope :instagram_oauth_token, -> { user.authorizations.where(provider: "instagram").oauth_token }
  # scope :instagram_oauth_secret, -> { user.authorizations.where(provider: "instagram").oauth_secret }

  friendly_id :name, :use => :slugged

  attr_accessible :name, :twitter_handle, :instagram_handle, :tumblr_handle

  # may remove twitter_handle validation once we auth more users
  validates_presence_of :name#, :twitter_handle

  belongs_to :user
  has_many :board_cards
  has_many :boards, through: :board_cards
  has_many :posts

  before_save :set_instagram_id

  def set_instagram_id
    return "" if instagram_handle.to_s == ""
    self.instagram_id = get_instagram_id(instagram_handle)
  end

  def oauth_token(service)
    # debugger
    self.user.authorizations.where(provider: service).first.oauth_token
  end

  def oauth_secret(service)
    self.user.authorizations.where(provider: service).first.oauth_secret
  end

  # def 

end

