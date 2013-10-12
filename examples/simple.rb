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

household = FellowshipOne::Household.new
household.household_name = 'Test 8'
attrs = household.to_attributes
household.save

# person = FellowshipOne::Person.new
# person.household_id = household.id.to_i
# person.id = nil
# #person.household_member_type['@id'] = 1
# #person.status['@id'] = 1
# person.first_name = 'Wes'
# person.last_name = 'Hays'

# person.save


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


## Add donation to household
contribution = FellowshipOne::Contribution.new
contribution.amount = '399.00'
contribution.fund['@id'] = fund_to_use.id
contribution.household['@id'] = household.id.to_i
contribution.received_date = Date.today.to_s
contribution.save

