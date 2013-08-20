class CardAPI

  def initialize
    p "HEY THERE ITS CARDAPI"
  end

	def get_posts(user)
		posts = []
	end

  private

	def get_instagrams(id)
		instagram = Instagram.client(access_token: instagram_token)
    @response = instagram.user_recent_media(id)
    instagrams = []
    if @api
      @response.each_with_index do |instagram,i|
        instagrams[i] = {}
        instagrams[i][:provider]				= 'instagram'
        instagrams[i][:id] 							= instagram['id']
        instagrams[i][:text] 						= instagram['caption']['text']
        instagrams[i][:thumbnail] 			= instagram['images']['thumbnail']['url']
        instagrams[i][:small_image] 		= instagram['images']['low_resolution']['url']
        instagrams[i][:standard_image] 	= instagram['images']['standard_resolution']['url']
        instagrams[i][:created]  				= DateTime.parse(instagram['created_time']).to_time.to_i
        instagrams[i][:url] 						= instagram['link']
      end
      instagrams
    else
      []
    end
	end

	def get_tweets
    # TODO-JW: look into -- respond_to :json
    @card = Card.find(params[:id])
    @api = Twitter.user_timeline(@card.twitter_handle, options={count: 10})
    if @api
      tweets = []
      @api.each_with_index do |tweet,i|
        tweets[i] = {}
        tweets[i][:provider] 	= 'twitter'
        tweets[i][:id] 				= String(tweet.id)
        tweets[i][:text]     	= auto_link(tweet.text)
        tweets[i][:created]  	= tweet.created_at
        tweets[i][:user_id]  	= tweet.user.screen_name
      end
      tweets 
    else
      []
    end
  end

end