class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
    @users_tweets = Twitter.user_timeline(@card.twitter_handle)
    @tweets_text = []
    @users_tweets.each {|tweet| @tweets_text << tweet.text} 
  end

  def new
    @card = Card.new
  end

  def edit
    @card = Card.find(params[:id])
  end
  
  # THIS WORKS if we need to revert
  # def create
  #   Card.create(name: params[:card][:twitter_handle], twitter_handle: params[:card][:twitter_handle])
  #   redirect_to cards_path
  # end

  def create
    @card = Card.new(name: params[:card][:twitter_handle], twitter_handle: params[:card][:twitter_handle])
    if @card.save
      redirect_to @card, :notice => "Successfully created card."
    else
      render action: 'new'
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to cards_path, :notice => "Successfully destroyed card."
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(params[:card])
      redirect_to @card, :notice  => "Successfully updated card."
    else
      render :action => 'edit'
    end
  end

end
