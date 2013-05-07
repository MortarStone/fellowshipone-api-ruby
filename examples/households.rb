# *******************************************
# This is a demo file to show usage.
#
# @package FellowshipOneAPI
# @authors Wes Hays <weshays@gbdev.com>
# ******************************************* 

require File.dirname(__FILE__) + '/../lib/fellowship_one.rb'

require File.dirname(__FILE__) + '/f1_keys.rb'
include F1Keys

FellowshipOne::Api.connect(CHURCH_CODE, CONSUMER_KEY, CONSUMER_SECRET, OAUTH_TOKEN, OAUTH_SECRET, IS_PRODUCTION)

household = FellowshipOne::Household.load_by_id(27590670)
puts '*****************'
puts household.inspect
puts '*****************'
puts '*****************'

hh_1 = FellowshipOne::Search.search_for_household_by_name("hays")

hh_2 = FellowshipOne::Search.search_for_household_by_name("feller")

puts hh_1.all_names
puts hh_1.ids
puts '*****************'

puts hh_2.all_names
puts hh_2.ids
puts '*****************'

mhl = FellowshipOne::MergeableHouseholdList.new
mhl.add(hh_1)
mhl.add(hh_2)

puts mhl.all_names

puts mhl.ids

