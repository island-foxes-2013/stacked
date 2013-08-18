Rails.application.config.middleware.use OmniAuth::Builder do
  # ap "*" * 100
  # ap ENV['INSTAGRAM_ID']
  # ap ENV['INSTAGRAM_SECRET']
  provider :instagram, ENV['INSTAGRAM_ID'], ENV['INSTAGRAM_SECRET']
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :twitter, 'SzMmwvT5DN8PRCRUirOMgA', 'O5aJFY2CYMQFVZIH3W2Pe1Qwj3zQsOzNCxFskBKaNTs'
  # provider :facebook, 'APP_ID', 'APP_SECRET'
  # provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end
