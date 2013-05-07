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
mpl = FellowshipOne::MergeablePersonList.new
mpl.add(person_list)
mpl.merge(person_list_2)

puts "--- After mpl.merge(person_list_2) ---"
puts mpl.names
puts 

# loads every person on F1
mpl_2 = FellowshipOne::MergeablePersonList.load_all("aa","az")
puts '--- After MergeablePersonList.load_all("aa","az") ---'
puts mpl_2.names
puts

# loads a range of people from "ha*" to "hz*"
mpl_3 = FellowshipOne::MergeablePersonList.load_all("ha","hz")

puts '--- After MergeablePersonList.load_all("ha","hz") ---'
puts mpl_3.names
puts

mpl_2.merge(mpl_3)

puts "--- After mpl_2.merge(mpl_3) ---"
puts mpl_2.names
puts


puts '--- Output of "puts person_list.ids" ---'
puts person_list.ids
puts

