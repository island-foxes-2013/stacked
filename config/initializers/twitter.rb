# Stacked Application's consumer_key and secret
Twitter.configure do |config|
  # ENV VARIABLES ARE NOT WORKING
  # config.consumer_key = ENV['TWTTER_KEY']
  # config.consumer_secret = ENV['TWITTER_SECRET']

  # HARD CODING THESE FOR NOW WORKS
  # config.consumer_key = 'SzMmwvT5DN8PRCRUirOMgA'
  # config.consumer_secret = 'O5aJFY2CYMQFVZIH3W2Pe1Qwj3zQsOzNCxFskBKaNTs'
  config.consumer_key = ENV['TWITTER_KEY']
  config.consumer_secret = ENV['TWITTER_SECRET']
end

# Then, for each user's access token/secret pair, instantiate a Twitter::Client:
<<<<<<< HEAD
eric  = Twitter::Client.new(
  oauth_token: ENV['TWITTER_OAUTH_TOKEN'],
  oauth_token_secret: ENV['TWITTER_OAUTH_TOKEN_SECRET']
)
=======
>>>>>>> master
