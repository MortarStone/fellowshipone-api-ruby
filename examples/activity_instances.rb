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
  puts [activity.name, activity.description].join(' :: ')

  schedule_list = FellowshipOne::ScheduleList.new({activity_id: activity.id})
  schedule_list.each do |schedule|
    puts [" =>  #{schedule.id}", schedule.name, schedule.start_time, schedule.end_time].join(' :: ')

    list = FellowshipOne::ActivityInstanceList.new({schedule_id: schedule.id})
    list.each do |item|
      # puts ["  ===>  #{item.id}", item.start_date_time, item.start_checkin, item.end_checkin, item.schedule.id, item.schedule.name, item.schedule.start_time, item.schedule.end_time].join(' :: ')
      puts ["  ===>  #{item.id}", item.start_date_time, item.start_checkin, item.end_checkin].join(' :: ')
    end
  end
end

