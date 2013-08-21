Rails.application.config.middleware.use OmniAuth::Builder do
  # ap "*" * 100
  # ap ENV['INSTAGRAM_ID']
  # ap ENV['INSTAGRAM_SECRET']

  # FOR PROD
  # provider :instagram, '14803833ba684ba5989a405f2214279e', '98ae7bdc222f4527b37016ecce660bda'

  # FOR DEV
  provider :instagram, ENV['INSTAGRAM_ID'], ENV['INSTAGRAM_SECRET']

  # provider :instagram, 'ENV['INSTAGRAM_ID']', ENV['INSTAGRAM_SECRET']
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  # provider :facebook, 'APP_ID', 'APP_SECRET'
  # provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end