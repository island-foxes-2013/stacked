class SearchesController < ApplicationController

  def index
    # Ransack gem query
    q = params[:q]
    @boards_searchresults = Board.search(name_cont: q).result
    @cards_searchresults = Card.search(name_cont: q).result
    @cards_twitterhandle_searchresults = Card.search(twitter_handle_cont: q).result
  end

end
