class CardsController < ApplicationController

  include Twitter::Autolink

  include CardHelper

  def index
    @cards = Card.all
  end

  def show
    #TODO: fix this route
    @card = Card.find(params[:id])
    @api = Twitter.user_timeline(@card.twitter_handle, options={count: 10})
    if @api
      tweets = []
      @api.each_with_index do |tweet,i|
        tweets[i] = {}
        tweets[i][:tweet_id] = String(tweet.id)
        tweets[i][:text]     = auto_link(tweet.text)
        tweets[i][:created]  = tweet.created_at
        tweets[i][:user_id]  = tweet.user.screen_name
      end
    end
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
    board_slug = params[:card][:board]
    p board_slug
    @card = Card.new(
      name:             params[:card][:twitter_handle], 
      twitter_handle:   params[:card][:twitter_handle],
      instagram_handle: params[:card][:instagram_handle],
      tumblr_handle:    params[:card][:tumblr_handle])
    if board_slug
      board = Board.find_by_slug(board_slug)
      @card.boards << board
    end
    @card.user = current_user
    if @card.save
      ServiceManagerWorker.perform_async(@card.id)
      if board_slug
        p "going to board_path"
        redirect_to board_path(board)
      else
      # instagram = Instagram.client(access_token: instagram_token)
      # ap instagram.user_recent_media(@card.instagram_id, count: 4)
        redirect_to @card, :notice => "Successfully created card."
      end
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

  # TODO-JW: Build a Factory to handle each services
  #   - put in the lib folder
  #   - standardize subset of JSON that is common across
  #     all services, add "service_name" attribute as well
  #   - on JS side, add contstructor-style factory renderers
  #
  # TODO-JW: example of above
  #
  # def get_posts
  #   @card = Card.find(params[:id])
  #   #[:twitter, :instagram].each do |service|
  #   SERVICES.each do |service|
  #     @api = CardAPI.new(params[:service_name])
  #     posts += @api.get_posts
  #   end
  #   render json: posts
  # end


  def get_posts
    card = Card.find_by_slug(params[:id])
    posts = Post.find_by_card_id(card.id)
    if !posts || posts.updated_epoch < (Time.now - 1.minute).to_i
      ServiceManagerWorker.perform_async(card.id)
    end

    # ServiceManagerWorker.perform_async(card.id)
    ap "*" * 100
    # ap Post.all
    render json: card.posts.first
    
    # render json: ServiceManager.get_posts(card)
  end

end
