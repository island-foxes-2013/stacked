# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Board < ActiveRecord::Base
  attr_accessible :name, :description

  validates_presence_of :name
  has_many :cards, through: :board_cards

end
