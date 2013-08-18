# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  slug        :string(255)      not null
#  user_id     :integer
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
    # @search = Board.search(params[:q])
    # @search_suggestions = @search.result(distinct:true)
    q = params[:q]
    @boards_searchresults = Board.search(name_cont: q).result
    @cards_searchresults = Card.search(name_cont: q).result
    # @cards = Card.search(twitter_handle_cont: q).result
    @users_searchresults = User.search(name_cont: q).result
  end

end
