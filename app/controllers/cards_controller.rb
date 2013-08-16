class CardsController < ApplicationController
  def index
    @cards = Cards.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(twitter_handle: params[:twitter_handle])
  end

  def show
  end

end
