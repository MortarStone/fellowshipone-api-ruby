# *******************************************
# This is a demo file to show usage.
#
# @package FellowshipOneAPI
# @authors Wes Hays <weshays@gbdev.com>
# ******************************************* 

require File.dirname(__FILE__) + '/../lib/fellowship_one.rb'

require File.dirname(__FILE__) + '/f1_keys.rb'
include F1Keys

FellowshipOne::Api.connect(CHURCH_CODE, CONSUMER_KEY, CONSUMER_SECRET, OAUTH_TOKEN, OAUTH_SECRET, IS_PRODUCTION)

#looks up person with ID # 44639467
person = FellowshipOne::Person.load_by_id(44639467)

puts "--- After person.inspect ---"
puts person.inspect
puts

person_list = FellowshipOne::Search.search_for_person_by_name("hays")
person_list_2 = FellowshipOne::Search.search_for_person_by_name("feller")

#merges person_list and person_list_2
person_list.merge(person_list_2)

puts "--- After person_list.merge(person_list_2) ---"
puts person_list.names
puts

# loads every person on F1
person_list_3 = FellowshipOne::PersonList.load_all
puts "--- After PersonList.load_all ---"
puts person_list_3.names
puts

# loads a range of people from "ha*" to "hz*"
person_list_4 = FellowshipOne::PersonList.load_all("ha","hz")

puts '--- After PersonList.load_all("ha","hz") ---'
puts person_list_4.names
puts

person_list.merge(person_list_4)

puts "--- After person_list.merge(person_list_4) ---"
puts person_list_4.names
puts


puts '--- Output of "puts person_list.get_ids" ---'
puts person_list.get_ids
puts

puts '--- Output of "puts person_list.get_uniq_ids" ---'
puts person_list.get_uniq_ids
puts


