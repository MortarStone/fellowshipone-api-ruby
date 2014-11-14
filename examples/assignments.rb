# *******************************************
# This is a demo file to show usage.
#
# @package FellowshipOneAPI
# @authors Wes Hays <wes@gbdev.com>
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
  puts [activity.id, activity.name].join(' :: ')

  begin
    assignment_list = FellowshipOne::AssignmentList.new({activity_id: activity.id})
    assignment_list.each do |assignment|
      puts [" =>  #{assignment.id}", assignment.person_id].join(' :: ')
    end
  rescue
    puts ' => NO ASSIGNMENTS'
  end
end

