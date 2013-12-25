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


email_to_search_for = 'some@donor.com'

people = FellowshipOne::Search.search_for_person_by_communication(email_to_search_for)

person = nil
if people.count == 0
  household = FellowshipOne::Household.new
  household.household_name = 'Some Donors'
  household.save

  person = FellowshipOne::Person.new
  person.household_id = household.id.to_s
  person.id = ''
  person.household_member_type['@id'] = '1'
  person.status['@id'] = '1'
  person.first_name = 'Jim'
  person.last_name = 'Henson'
  person.save


  communication = FellowshipOne::Communication.new(person.id)
  communication.communication_type['@id'] = '4'
  communication.communication_type['name'] = 'Email'
  communication.communication_general_type = 'Email'
  communication.preferred = 'true'
  communication.communication_value = email_to_search_for
  communication.search_communication_value = email_to_search_for
  communication.save
else
  person = people.detect { |p| p.email_addresses.include?(email_to_search_for) }
  person = people.first if person.nil?
end

# Need a fund to give to. The church should select an *active* fund when they
# create an account so you do not have to do the following.
fund_list = FellowshipOne::FundList.new
active_funds = fund_list.collect { |f| f.is_active ? f : nil }.compact
general_funds = active_funds.collect { |f| (f.name.downcase.include?('tithe') or f.name.downcase.include?('general')) ? f : nil }.compact
fund_to_use = if general_funds.empty?
  active_funds.detect { |f| f.fund_type['name'].downcase == 'contribution'}
else
  general_funds.first
end
raise 'Fund to give to not found' if fund_to_use.nil?

# Do a periodic check to see if fund is still active.
# fund = fund_list = FellowshipOne::FundList.load_by_id(SOME_FUND_ID)
# unless fund.is_active
#   # notify church fund is not active
# end

# Add donation to household
contribution = FellowshipOne::Contribution.new
contribution.id = '' # Needs to blank and not nil
contribution.amount = '943.00'
contribution.fund['@id'] = fund_to_use.id
contribution.household['@id'] = person.household_id 
contribution.received_date = Time.now.utc.iso8601 # Needs to be this format
contribution.contribution_type['@id'] = 3 # Credit Card
contribution.address_verification = false
contribution.save



