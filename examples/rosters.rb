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



activity_list = FellowshipOne::ActivityList.new
activity_list.each do |activity|
  puts [activity.id, activity.name, activity.description].join(' :: ')

  roster_list = FellowshipOne::RosterList.new({activity_id: activity.id})
  roster_list.each do |roster|
    puts [" =>  #{roster.id}", roster.name, roster.activity.id, roster.activity.name, roster.roster_folder.id, roster.roster_folder.name].join(' :: ')
  end
end
