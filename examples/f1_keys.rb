module F1Keys

  CONSUMER_KEY = '-- CONSUMER_KEY --'
  CONSUMER_SECRET = '-- CONSUMER_SECRET --'
  ENVIRONMENT = 'production'
  CHURCH_CODE = '-- CHURCH_CODE --' 

  CALLBACK_URL = 'http://www.example.com/fellowship_one_connect'

  OAUTH_TOKEN = '-- OAUTH_TOKEN --'
  OAUTH_SECRET = '-- OAUTH_SECRET --' 

  ###############################################################
  IS_PRODUCTION = ENVIRONMENT == 'production' ? true : false

end