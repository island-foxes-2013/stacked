
# Stacked application's consumer key and secret
Instagram.configure do |config|
  config.client_id = ENV['INSTAGRAM_ID']
  config.client_secret = ENV['INSTAGRAM_SECRET']
end

instagram = Instagram.client(access_token: ENV['INSTAGRAM_TOKEN'])
