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

fund_list = FellowshipOne::FundList.new
fund_list.each do |fund|
  puts fund.name
  subfund_list = FellowshipOne::SubFundList.new(fund.id)
  subfund_list.each do |subfund|
    puts "--- #{subfund.name}"
  end
end

# puts '*****************'
# puts fund_list.inspect
# puts '*****************'
# puts '*****************'

#fund = FellowshipOne::Fund.load_by_id(185175)
