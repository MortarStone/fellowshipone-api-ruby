# *******************************************
# This is a demo file to show usage.
#
# @package FellowshipOneAPI
# @authors Wes Hays <weshays@gbdev.com>
# ******************************************* 

require 'debugger'

require File.dirname(__FILE__) + '/../lib/fellowship_one.rb'

require File.dirname(__FILE__) + '/f1_keys.rb'

FellowshipOne::Api.connect(F1Keys::CHURCH_CODE, 
													 F1Keys::CONSUMER_KEY, 
													 F1Keys::CONSUMER_SECRET, 
													 F1Keys::OAUTH_TOKEN, 
													 F1Keys::OAUTH_SECRET, 
													 F1Keys::IS_PRODUCTION)

start_date = "2013-04-01"
end_date = "2013-04-21"
contribution_list = FellowshipOne::Search.search_for_contributions_by_date(start_date, end_date)


# this needs to be moved into something else... 
donation_list = []
contribution_list.each do |cl|
	date = Date.parse(cl.received_date).to_s
	name = FellowshipOne::Household.load_by_id( cl.household_id ).household_name
	amount = cl.amount
	id = cl.household_id

	donation_list << {date: date, amount: amount, household_name: name, household_id: id}
end

donation_list.each do |donation|
	puts donation
end