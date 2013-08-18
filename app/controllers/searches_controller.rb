class SearchesController < ApplicationController

  def index
    # Ransack gem query
    q = params[:q]
    @boards_searchresults = Board.search(name_cont: q).result
    @cards_searchresults = Card.search(name_cont: q).result
    @users_searchresults = User.search(name_cont: q).result

    # TODO NOT WORKING YET - look into Ransack cont helper
    # @cards_twitterhandle_searchresults = Card.search(twiter_handle_cont: q).result
  end

end
