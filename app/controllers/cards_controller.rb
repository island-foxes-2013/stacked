class CardsController < ApplicationController

  include Twitter::Autolink

  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
    # http://rdoc.info/gems/twitter/Twitter/API/Timelines
    # user_timeline(user, options={count: 200, since_id: , max_id:})
    # returns (Array<Twitter::Tweet>)
    @api = Twitter.user_timeline(@card.twitter_handle, options={count: 10})
    tweets = []
    @api.each_with_index do |tweet,i|
      tweets[i] = {}
      tweets[i][:tweet_id] = tweet.id
      tweets[i][:text]     = auto_link(tweet.text)
      tweets[i][:created]  = tweet.created_at
      unless tweet.urls.empty?
        tweets[i][:url] = tweet.urls[0].url
      end
    end
    ap tweets
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
    @card.user = current_user
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

  def get_tweets
    @card = Card.find(params[:id])
    @api = Twitter.user_timeline(@card.twitter_handle, options={count: 10})
    tweets = []
    @api.each_with_index do |tweet,i|
      tweets[i] = {}
      tweets[i][:tweet_id] = tweet.id
      tweets[i][:text]     = auto_link(tweet.text)
      tweets[i][:created]  = tweet.created_at
      tweets[i][:user_id]  = params[:id] 
      # ap tweet.attrs
      # unless tweet.urls.empty?
      #   tweets[i][:url] = tweet.urls[0].expanded_url
      # end
      ap tweets
    end
    render json: tweets 
  end

end
