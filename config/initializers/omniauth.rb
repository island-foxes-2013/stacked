Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'SzMmwvT5DN8PRCRUirOMgA', 'O5aJFY2CYMQFVZIH3W2Pe1Qwj3zQsOzNCxFskBKaNTs'
  # provider :facebook, 'APP_ID', 'APP_SECRET'
  # provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end