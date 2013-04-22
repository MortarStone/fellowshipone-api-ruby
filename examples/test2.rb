#!/usr/bin/ruby

#
# Example code to query donations between a specific date range
#

require File.dirname(__FILE__) + '/../lib/fellowship_one'
require FELLOWSHIPONE_LIB_DIR + '/search'
require FELLOWSHIPONE_LIB_DIR + '/people'
require FELLOWSHIPONE_LIB_DIR + '/giving'

peep = FellowshipOne::People.new
pers = FellowshipOne::Person.new
givr = FellowshipOne::Giving.new
cont = FellowshipOne::Contribution.new

receipts = givr.search_for_contributions_by_date("2013-04-01","2013-04-14")

receipts["results"]["contributionReceipt"].each do |contributions|
	cont.initialize_from_json_object(contributions)
	name = peep.return_results_by_name(peep.get_houshold_members(cont.household["@id"]))
	fmt_name = name.join(", ")
	fmt_date = Date.parse(cont.received_date).to_s
	fmt_amount = cont.amount
	print fmt_date + ": " + fmt_name + " ==> " 
	puts "%.2f" % fmt_amount
end
