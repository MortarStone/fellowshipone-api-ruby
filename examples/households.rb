# *******************************************
# This is a demo file to show usage.
#
# @package FellowshipOneAPI
# @authors Wes Hays <weshays@gbdev.com>
# ******************************************* 

require File.dirname(__FILE__) + '/../lib/fellowship_one.rb'

require File.dirname(__FILE__) + '/f1_keys.rb'

FellowshipOne::Api.connect(F1Keys::CHURCH_CODE, 
                           F1Keys::CONSUMER_KEY, 
                           F1Keys::CONSUMER_SECRET, 
                           F1Keys::OAUTH_TOKEN, 
                           F1Keys::OAUTH_SECRET, 
                           F1Keys::IS_PRODUCTION)

# # household = FellowshipOne::Household.load_by_id(32849301)
# # puts '*****************'
# # puts household.inspect
# # puts '*****************'
# # puts '*****************'

hh_1 = FellowshipOne::Search.search_for_household_by_name("hays")
puts '*****************'
puts hh_1.inspect
puts '*****************'
puts '*****************'
puts hh_1.collect { |h| h.household_name }


# hh_2 = FellowshipOne::Search.search_for_household_by_name("feller")

# puts hh_1.all_names
# puts hh_1.ids
# puts '*****************'

# puts hh_2.all_names
# puts hh_2.ids
# puts '*****************'

# mhl = FellowshipOne::MergeableHouseholdList.new
# mhl.add(hh_1)
# mhl.add(hh_2)

# puts mhl.all_names

# puts mhl.ids


# household = FellowshipOne::HouseholdWriter.new({
#   :householdName => 'Some cool place',
#   :householdSortName => 'Landis',
#   :householdFirstName => 'Phil and Barbara'  
# })

# household.save_object