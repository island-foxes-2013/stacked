# == Schema Information
#
# Table name: board_cards
#
#  id         :integer          not null, primary key
#  board_id   :integer
#  card_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BoardCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :board
end
