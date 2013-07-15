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

start_date = "2009-01-01"
end_date = "2013-06-30"
contribution_list = FellowshipOne::Search.search_for_contributions_by_date(start_date, end_date)


contribution_list.each do |contribution|
  # Info to use
  # contribution.household_id
  # contribution.amount_cents
  # contribution.received_date
  # contribution.fund['name']

  people = FellowshipOne::MemberHouseholdList.new({:household_id => contribution.household_id})

  people.each do |person|
    puts "---------------------"
    puts person.first_name
    puts person.id 
    puts person.household_id
    puts person.first_name
    puts person.last_name
    puts person.gender
    puts person.date_of_birth
    puts person.marital_status
    puts "---------------------"
  end

end
