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


contribution_list = FellowshipOne::Search.search_for_contributions_by_date("2013-04-01","2013-04-21")

# this needs to be moved into something else... 
contribution_list.each do |cl|
		print FellowshipOne::Household.load_by_id( cl.household_id ).household_name
		print " => "
		puts cl.amount
end

# receipts["results"]["contributionReceipt"].each do |contributions|
#   cont.initialize_from_json_object(contributions)
#   name = peep.return_results_by_name(peep.get_houshold_members(cont.household["@id"]))
#   fmt_name = name.join(", ")
#   fmt_date = Date.parse(cont.received_date).to_s
#   fmt_amount = cont.amount
#   print fmt_date + ": " + fmt_name + " ==> " 
#   puts "%.2f" % fmt_amount
# end
