# Stacked Application's consumer_key and secret
Twitter.configure do |config|
  config.consumer_key = '6Oapz9UjwVsbpQQCDaL9FQ'
  config.consumer_secret = 'bFFjgddZVEbfv2x3Ak6vaG8NeCqY2nFazLCKgJ68'
end

# Then, for each user's access token/secret pair, instantiate a Twitter::Client:
eric  = Twitter::Client.new(
  oauth_token: '17861518-NUVAfsalQsBujIPPoGq4kgZM3SPwdJj1OAwXDGC7i',
  oauth_token_secret: 'Vg7bMv9bJuwhfgcFCa7LgNpC8Sj8YUI3nrfIM5kFJM'
)
