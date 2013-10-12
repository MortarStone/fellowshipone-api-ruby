# *******************************************
# This is a demo file to show usage.
#
# @package FellowshipOneAPI
# @authors Wes Hays <weshays@gbdev.com>
# ******************************************* 

require 'ruby-debug'

require File.dirname(__FILE__) + '/../lib/fellowship_one.rb'

require File.dirname(__FILE__) + '/f1_keys.rb'

FellowshipOne::Api.connect(F1Keys::CHURCH_CODE, 
                           F1Keys::CONSUMER_KEY, 
                           F1Keys::CONSUMER_SECRET, 
                           F1Keys::OAUTH_TOKEN, 
                           F1Keys::OAUTH_SECRET, 
                           F1Keys::IS_PRODUCTION)


# ## Add Household
# # household = FellowshipOne::HouseholdWriter.new({
# #   :householdName => 'Some cool place',
# #   :householdSortName => 'Landis',
# #   :householdFirstName => 'Phil',
# #   :lastSecurityAuthorization => nil,
# #   :lastActivityDate => DateTime.now.to_s,
# #   :createdDate => nil, #Date.today.to_s,
# #   :lastUpdatedDate => nil #DateTime.today.to_s
# # })
# # household.save_object

# household = FellowshipOne::Household.load_by_id(35154894)

# ## Add person to Household
# person = FellowshipOne::PersonWriter.new({
#   '@householdID' => '35154894',
#   'title' => '',
#   'salutation' => '',
#   'prefix' => 'Mr',
#   'suffix' => '',
#   'firstName' => 'Wes',
#   'lastName' => 'Hays'
# })

# # person = FellowshipOne::PersonWriter.new({
# #   '@householdID' => '35154894',
# #   'householdMemberType' => {
# #       '@id' => '1',
# #       '@uri' => 'https://mortarstone.fellowshiponeapi.com/v1/People/HouseholdMemberTypes/1',
# #       'name' => 'Head'
# #   },
# #   'status' => {
# #       '@id' => '1',
# #       '@uri' => '',
# #       'name' => nil,
# #       'comment' => nil,
# #       'date' => nil,
# #       'subStatus' => {
# #           '@id' => '',
# #           '@uri' => '',
# #           'name' => nil
# #       }
# #   },
# #   'lastName' => 'Hays'
# # })
# person.save_object


household = FellowshipOne::Household.new
household.household_name = 'Test 2'
attrs = household.to_attributes
debugger
asdf=234
#household.save


# person = FellowshipOne::Person.new
# person.household_id = 35154894
# person.household_member_type['@id'] = 1
# person.status['@id'] = 1
# person.first_name = 'Wes'
# person.last_name = 'Hays'
# debugger
# asdf=111

## Add donation to household


