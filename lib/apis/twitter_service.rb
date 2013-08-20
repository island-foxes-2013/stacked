class TwitterService
	include Twitter::Autolink
  def get_posts(card)
  	return [] unless card.twitter_handle
    @api = Twitter.user_timeline(card.twitter_handle, options={count: 10})
    if @api
      tweets = []
      @api.each_with_index do |tweet,i|
        tweets[i] = {}
        tweets[i][:provider] 	= 'twitter'
        tweets[i][:content] 	= 'text'
        tweets[i][:id] 				= String(tweet.id)
        tweets[i][:text]     	= auto_link(tweet.text)
        tweets[i][:created]  	= tweet.created_at.to_time.to_i
        tweets[i][:user_id]  	= tweet.user.screen_name
        tweets[i][:url]       = "https://twitter.com/#{tweet.user.screen_name}/statuses/#{tweet.id}"
      end
      tweets 
    else
      []
    end
  end
end