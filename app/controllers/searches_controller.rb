class SearchesController < ApplicationController

  def index
    # Ransack gem query
    q = params[:q]
    @boards_name_results = Board.search(name_cont: q).result
    @cards_name_results = Card.search(name_cont: q).result
    @cards_twitter_results = Card.search(twitter_handle_cont: q).result
    @cards_instagram_results = Card.search(instagram_handle_cont: q).result
  end

end
