# == Schema Information
#
# Table name: cards
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  twitter_handle :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Card < ActiveRecord::Base

  attr_accessible :name

  validates_presence_of :name
  has_many :boards, through: :board_cards

end
