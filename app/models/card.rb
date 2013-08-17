# == Schema Information
#
# Table name: cards
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  twitter_handle :string(255)
#  slug           :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Card < ActiveRecord::Base
	extend FriendlyId	

	friendly_id :name, :use => :slugged

  attr_accessible :name, :twitter_handle

  # may remove twitter_handle validation once we auth more users
  validates_presence_of :name, :twitter_handle
  has_many :board_cards
  has_many :boards, through: :board_cards

end

