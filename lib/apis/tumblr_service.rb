class TumblrService
	
  def get_posts(card)
  	return [] unless card.tumblr_handle
    if @api
      tweets = []
      @api.each_with_index do |tweet,i|
        tweets[i] = {}
        tweets[i][:provider] 	= 'tumblr'
        tweets[i][:content] 	= 'text'
        tweets[i][:id] 				= String(tweet.id)
        tweets[i][:text]     	= auto_link(tweet.text)
        tweets[i][:created]  	= tweet.created_at.to_time.to_i
        tweets[i][:user_id]  	= tweet.user.screen_name
      end
      tweets 
    else
      []
    end
  end
end