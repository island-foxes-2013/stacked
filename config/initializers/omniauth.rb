Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'F0jC3AzCLVNQkRLuCQyz2Q', 'gCPhS8iNo6oJuyXmWEj1NFb9FVz85rquZRAwT4y8Jw'
  # provider :facebook, 'APP_ID', 'APP_SECRET'
  # provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end
