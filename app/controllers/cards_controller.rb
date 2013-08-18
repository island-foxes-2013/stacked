class CardsController < ApplicationController

  include Twitter::Autolink

  include CardHelper

  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
    # http://rdoc.info/gems/twitter/Twitter/API/Timelines
    # user_timeline(user, options={count: 200, since_id: , max_id:})
    # returns (Array<Twitter::Tweet>)
    # @api = Twitter.user_timeline(@card.twitter_handle, options={count: 10})
    # tweets = []
    # @api.each_with_index do |tweet,i|
    #   tweets[i] = {}
    #   tweets[i][:tweet_id] = tweet.id
    #   tweets[i][:text]     = auto_link(tweet.text)
    #   tweets[i][:created]  = tweet.created_at
    #   unless tweet.urls.empty?
    #     tweets[i][:url] = tweet.urls[0].url
    #   end
    # end
    # ap tweets
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
    @card = Card.new(
      name: params[:card][:twitter_handle], 
      twitter_handle: params[:card][:twitter_handle],
      instagram_handle: params[:card][:instagram_handle])
    @card.user = current_user

    if @card.instagram_handle
      ap instagram_id(@card.instagram_handle)
      @card.instagram_id = instagram_id(@card.instagram_handle)
    end

    if @card.save
      # instagram = Instagram.client(access_token: instagram_token)
      # ap instagram.user_recent_media(@card.instagram_id, count: 4)
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
      unless tweet.urls.empty?
        tweets[i][:url] = tweet.urls[0].url
      end
    end
    render json: tweets 
  end

  def get_instagrams
    instagram = Instagram.client(access_token: instagram_token)
    @card = Card.find(params[:id])
    @response = instagram.user_recent_media(@card.instagram_id)
    instagrams = []
    @response.each_with_index do |instagram,i|
      instagrams[i] = {}
      instagrams[i][:instagram_id] = instagram['id']
      instagrams[i][:text] = instagram['caption']['text']
      instagrams[i][:thumbnail] = instagram['images']['thumbnail']['url']
      instagrams[i][:small_image] = instagram['images']['low_resolution']['url']
      instagrams[i][:standard_image] = instagram['images']['standard_resolution']['url']
      instagrams[i][:created]  = instagram['created_time']
      instagrams[i][:url] = instagram['link']
    end
    ap instagrams
    render json: instagrams
    # ap instagram.user_recent_media(@card.instagram_id)
  end



end
