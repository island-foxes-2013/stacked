class SearchesController < ApplicationController

  def index
   
    # if params [:q] is nil, set @boards_name_results to []
   @boards_name_results, @cards_name_results, @cards_twitter_results, @cards_instagram_results = [], [], [], []

    # Ransack gem query
    q = params[:q]

    if q
      @boards_name_results = Board.search(name_cont: q).result 
      @cards_name_results = Card.search(name_cont: q).result
      # @cards_name_results = Card.search(name_cont_or_twitter_handle_cont: q).result
      @cards_twitter_results = Card.search(twitter_handle_cont: q).result
      @cards_instagram_results = Card.search(instagram_handle_cont: q).result

      @cards = (@cards_name_results + @cards_twitter_results + @cards_instagram_results).uniq
    end

  end

end
