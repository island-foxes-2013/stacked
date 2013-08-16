class BoardCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :board
end