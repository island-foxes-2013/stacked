class SearchesController < ApplicationController

  def index
    # defaults
    cards_name_results = []
    cards_twitter_results = []
    cards_instagram_results = []
    @cards_results = []
    @boards_results = []

    # if a user searches ... q is Ransack gem query specific
    q = params[:q]
    if q
      cards_name_results = Card.search(name_cont: q).result
      cards_twitter_results = Card.search(twitter_handle_cont: q).result
      cards_instagram_results = Card.search(instagram_handle_cont: q).result

      @cards_results = (cards_name_results + cards_twitter_results + cards_instagram_results).uniq
      @boards_results = Board.search(name_cont: q).result
    end
  end

  def global
    # defaults
    cards_name_results = []
    cards_twitter_results = []
    cards_instagram_results = []
    @cards_results = []
    @boards_results = []

    # if a user searches ... q is Ransack gem query specific
    q = params[:q]
    if q
      cards_name_results = Card.search(name_cont: q).result
      cards_twitter_results = Card.search(twitter_handle_cont: q).result
      cards_instagram_results = Card.search(instagram_handle_cont: q).result

      @cards_results = (cards_name_results + cards_twitter_results + cards_instagram_results).uniq
      @boards_results = Board.search(name_cont: q).result
    end
    render partial: "layouts/search_results_template", locals: {cards_results: @cards_results, boards_results: @boards_results}
  end

end
