class BoardsController < ApplicationController

	def index
		@boards = Board.order('created_at DESC').limit(10)

    # Default Search Results
    @boards_results = []
    @cards_name_results = []
    @cards_twitter_results = []
    @cards_instagram_results = []

    # Ransack gem query
    q = params[:q]

    if q
      cards_name_results = Card.search(name_cont: q).result
      cards_twitter_results = Card.search(twitter_handle_cont: q).result
      cards_instagram_results = Card.search(instagram_handle_cont: q).result

      @cards_results = (cards_name_results + cards_twitter_results + cards_instagram_results).uniq
      @boards_results = Board.search(name_cont: q).result 
      p @cards_results
      p @boards_results
    end
    
    
	end

  def show
    @board = Board.find(params[:id])
    @card = Card.new
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(params[:board])
    @board.user = current_user
    if @board.save
      redirect_to @board, :notice => "Successfully created board."
    else
      render :action => 'new'
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update_attributes(params[:board])
      redirect_to @board, :notice  => "Successfully updated board."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_url, :notice => "Successfully destroyed board."
  end

end
