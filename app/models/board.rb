# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  slug        :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Board < ActiveRecord::Base
	extend FriendlyId	
	friendly_id :name, use: :slugged
  attr_accessible :name, :description

  validates_presence_of :name

  belongs_to :user
  has_many :board_cards
  has_many :cards, through: :board_cards

  def search
    @search = Board.search(params[:q])
    @search_suggestions = @search.result(distinct:true)
  end

end
