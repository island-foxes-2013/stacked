class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(twitter_handle: params[:twitter_handle])
  end

  def show
    @card = Card.find(params[:id])
  end

end
