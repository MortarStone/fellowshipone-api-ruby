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

#looks up person with ID # 53835429
# person = FellowshipOne::Person.load_by_id(53835429)

# puts "--- After person.inspect ---"
# puts person.inspect
# puts

# person_list = FellowshipOne::Search.search_for_person_by_name("hays")
# person_list_2 = FellowshipOne::Search.search_for_person_by_name("feller")

# #merges person_list and person_list_2
# mpl = FellowshipOne::MergeablePersonList.new
# mpl.add(person_list)
# mpl.merge(person_list_2)

# puts "--- After mpl.merge(person_list_2) ---"
# puts mpl.names
# puts 

# loads every person on F1
mpl_2 = FellowshipOne::MergeablePersonList.load_all("aa","az")
puts '--- After MergeablePersonList.load_all("aa","az") ---'
puts mpl_2.names
puts

# # loads a range of people from "ha*" to "hz*"
# mpl_3 = FellowshipOne::MergeablePersonList.load_all("ha","hz")

# # load every person created on or after start_date
# start_date = '2009-01-01'
# results = FellowshipOne::Search.search_for_person_created_on_or_after(start_date)

# puts '--- After MergeablePersonList.load_all("ha","hz") ---'
# puts mpl_3.names
# puts

# mpl_2.merge(mpl_3)

# puts "--- After mpl_2.merge(mpl_3) ---"
# puts mpl_2.names
# puts

# puts "--- Created on or after 2009-01-01 ---"
# puts results
# puts


# puts '--- Output of "puts person_list.ids" ---'
# puts person_list.ids
# puts

