# Stacked Application's consumer_key and secret
Twitter.configure do |config|
  config.consumer_key = ENV['TWTTER_KEY']
  config.consumer_secret = ENV['TWITTER_SECRET']
end

# Then, for each user's access token/secret pair, instantiate a Twitter::Client:
eric  = Twitter::Client.new(
  oauth_token: '115878008-ISalW5qdqRRrVk8z52mABRRQDxXVJTMdhBZ6GBTL',
  oauth_token_secret: 'bpC5KJRRcB0lZ4L4vcfuwKmbjvW4FiYgs9grwxYk0'
)
