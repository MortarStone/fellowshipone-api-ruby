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

type_group_list = FellowshipOne::TypeGroupList.new
type_group_list.each do |type_group|

  type_list = FellowshipOne::TypeList.new({type_group_id: type_group.id})
  type_list.each do |type|
    puts [[type.type_group.id, type.type_group.name].join(' :: '), [type.id, type.name].join(' :: ')].join(' -- ')
  end

end
