# *******************************************
# This is a demo file to show usage.
#
# @package FellowshipOneAPI
# @authors Wes Hays <weshays@gbdev.com>
# ******************************************* 

#require 'ruby-debug'
require File.dirname(__FILE__) + '/../lib/fellowship_one.rb'

require File.dirname(__FILE__) + '/f1_keys.rb'
include F1Keys

# Callback URL
callback_url = 'https://www.example.com/oauth/callback'

# Creates a connection to get any OAuth object
connection = FellowshipOne::Api.establish_connection(
  F1Keys::CHURCH_CODE, 
  F1Keys::CONSUMER_KEY, 
  F1Keys::CONSUMER_SECRET,
  callback_url,
  false
)

# user should redirect to URL to give access.
access_url = connection.authorize_url(:oauth_callback => callback_url)
### Store connection in session: session[:f1_connection] = connection
### Redirect to access_url
### On success it will be redirected to the callback_url
### access GET variable oauth_token: params[:oauth_token]
### Get connection from session: connection = session[:f1_connection]


raise 'The code below will fail because it needs to get information from a connection that was given access.  However, everything above worked fine.'


access_token = connection.get_access_token
access_oauth_token = access_token.token
access_oauth_secret = access_token.secret
### Store access_oauth_token and access_oauth_secret for later requests

