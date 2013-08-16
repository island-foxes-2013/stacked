class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    Card.create(name: params[:twitter_handle], twitter_handle: params[:twitter_handle])
    redirect_to cards_path
  end

  def show
    @card = Card.find(params[:id])
  end

end
