class BoardsController < ApplicationController

	def index
		@boards = Board.order('created_at DESC').limit(10)
	end

  def show
    @board = Board.find_by_slug(params[:id])
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
