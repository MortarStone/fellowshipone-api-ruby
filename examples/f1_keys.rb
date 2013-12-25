module F1Keys

  CONSUMER_KEY = '*** CONSUMER KEY **'
  CONSUMER_SECRET = '*** CONSUMER SECRET ***'
  ENVIRONMENT = 'staging'
  CHURCH_CODE = '*** CONSUMER CODE ***'

  CALLBACK_URL = 'http://www.example.com/fellowship_one_connect'

  OAUTH_TOKEN = '*** OAUTH TOKEN ***'
  OAUTH_SECRET = '*** OAUTH SECRET ***'

  ###############################################################
  IS_PRODUCTION = ENVIRONMENT == 'production' ? true : false

end