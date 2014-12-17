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

page = 1
created_date = '2014-12-01'
updated_date = '2014-12-01'

pl1_ids = []
pl2_ids = []

page = 1
done = false
while !done do
  pl1 = FellowshipOne::Search.search_for_person_created_on_or_after(created_date, page)
  puts "PL1: #{page}/#{pl1.additional_pages}"
  pl1.each { |p| pl1_ids << p.id }
  if pl1.additional_pages > 0
    page = page + 1
  else
    done = true
  end
end


page = 1
done = false
while !done do
  pl2 = FellowshipOne::Search.search_for_person_updated_on_or_after(updated_date, page)
  puts "PL2: #{page}/#{pl2.additional_pages}"
  pl2.each { |p| pl2_ids << p.id }
  if pl2.additional_pages > 0
    page = page + 1
  else
    done = true
  end
end



debugger
asdf=234
