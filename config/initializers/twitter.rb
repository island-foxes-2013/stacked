# Stacked Application's consumer_key and secret
Twitter.configure do |config|
  config.consumer_key = ENV['TWTTER_KEY']
  config.consumer_secret = ENV['TWITTER_SECRET']
end

# Then, for each user's access token/secret pair, instantiate a Twitter::Client:
eric  = Twitter::Client.new(
  oauth_token: twitter_credentials[twitter_oauth_token],
  oauth_token_secret: twitter_credentials[twitter_oauth_token_secret]
)
